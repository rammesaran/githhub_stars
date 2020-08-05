import 'package:github_stars_app/src/model/githubmodel.dart';
import 'package:github_stars_app/src/providers/db_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServie {
  Future<List<Items>> fetchGithubRepo() async {
    final url =
        "https://api.github.com/search/repositories?q=created:&gt;2020-04-29&amp;sort=stars&amp;order=desc";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final Iterable jsonData = responseBody["items"];
      return jsonData.map((e) => Items.fromJson(e)).toList();
    } else {
      throw Exception("Something went wrong");
    }
  }

//for sqlflite - insertation
  Future<List<Items>> getDBInstance() async {
    final url =
        "https://api.github.com/search/repositories?q=created:&gt;2020-04-29&amp;sort=stars&amp;order=desc";
    final response = await http.get(url);
    final responseBody = json.decode(response.body);
    final Iterable jsonData = responseBody['items'];
    return jsonData.map((e) {
      GitHubStarDBProvider.dbProvider.addPersonToDatabase(Items.fromJson(e));
    }).toList();
  }
}
