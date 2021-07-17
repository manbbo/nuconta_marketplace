import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta_marketplace/constants/api/APICallConstant.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
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
        cache: GraphQLCache(store: InMemoryStore()),
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

    await HiveStore.openBox("UserModel");

    return await getClient().query(_options);
  }

  Future<UserModel> getUserResult() async {
    await initHiveForFlutter();

    String readRepo = """
      {
        viewer {
          id,
          name,
          balance
        }
    }
    """;

    final res = await this.query(readRepo);

    if (res.hasException) {
      throw "Unable to retrieve user. Please try again.";
    } else {
      return UserModel.fromMap(res.data);
    }
  }

  Future<List<OfferModel>> getOffersResult() async {
    await initHiveForFlutter();

    String readRepo = """
      {
        viewer {
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

    if (res.hasException) {
      throw "Unable to retrieve offers list. Please try again.";
    } else {
      return (res.data.entries.last.value["offers"] as List)?.map((e) => OfferModel.fromMap(e))?.toList();
    }
  }
}