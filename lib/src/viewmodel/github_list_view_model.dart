import 'package:flutter/foundation.dart';
import 'package:github_stars_app/src/services/apiservice.dart';
import 'package:github_stars_app/src/viewmodel/github_view_model.dart';

class GithubListViewModel extends ChangeNotifier {
  List<GitHubViewModel> githubData = List<GitHubViewModel>();

  Future<void> fetchGithubData() async {
    final result = await ApiServie().fetchGithubRepo();
    //final result = await ApiServie().getDBInstance();
    this.githubData = result.map((e) => GitHubViewModel(items: e)).toList();
    notifyListeners();
  }
}
