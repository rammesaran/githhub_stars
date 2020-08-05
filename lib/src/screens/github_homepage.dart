import 'package:flutter/material.dart';
import 'package:github_stars_app/src/viewmodel/github_list_view_model.dart';
import 'package:github_stars_app/src/widgets/github_list.dart';
import 'package:provider/provider.dart';

class MyGitHubPage extends StatefulWidget {
  @override
  _MyGitHubPageState createState() => _MyGitHubPageState();
}

class _MyGitHubPageState extends State<MyGitHubPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<GithubListViewModel>(context, listen: false).fetchGithubData();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GithubListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GitHub Repo"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: GitHubList(gitHubData: viewModel.githubData),
            ),
          ],
        ),
      ),
    );
  }
}
