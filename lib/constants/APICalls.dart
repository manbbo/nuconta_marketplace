import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nuconta_marketplace/constants/api/APICallConstant.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

class API {

  GraphQLClient getClient() {
    final HttpLink httpLink = HttpLink(APICallConstant.API_URL);

    final AuthLink auth = AuthLink(getToken: () =>
      APICallConstant.API_TOKEN
    );

    final Link link = auth.concat(httpLink);

    GraphQLClient client =
      GraphQLClient(
        cache: GraphQLCache(store: HiveStore()),
        link: link,
      );

    return client;
  }

  Future<QueryResult> query (String queries) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      document: gql(queries),
      pollInterval: Duration(seconds: 15),
      fetchResults: true,
    );

    return await getClient().query(_options);
  }

  Future<Widget> getWidgetUser() async {
    return GraphQLProvider(
      client: ValueNotifier(getClient()),
      child: MaterialApp (

      ),
    );
  }

  Future<UserModel> getResult() async {
    await initHiveForFlutter();

    String readRepo = """
      {
    query: viewer {
          id,
          name,
          balance,
          offers {
            id,
            price,
            product {
              id,
              name,
              description,
              image
            }
          }
        }
    }
    """;

    final res = await this.query(readRepo);

    UserModel user;

    if (res.hasException) {
      throw "Unable to retrieve user. Please try again.";
    } else {
      user = UserModel.fromMap(res.data);
    }

    return user;
  }
}