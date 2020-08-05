import 'package:github_stars_app/src/model/githubmodel.dart';

class GitHubViewModel {
  final Items items;

  GitHubViewModel({this.items});

  int get stars {
    return this.items.stargazersCount;
  }

  String get repoName {
    return this.items.name;
  }

  String get repoDescription {
    return this.items.description;
  }

  String get loginName {
    return this.items.owner.login;
  }

  String get avatherUrl {
    return this.items.owner.avatarUrl;
  }
}
