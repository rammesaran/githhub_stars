import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_stars_app/src/viewmodel/github_view_model.dart';

class GitHubList extends StatelessWidget {
  final List<GitHubViewModel> gitHubData;

  GitHubList({this.gitHubData});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: gitHubData.length,
        itemBuilder: (context, index) {
          final gitHubIndex = this.gitHubData[index];

          return Container(
            height: 200,
            width: double.infinity,
            child: ListTile(
              trailing: Text(gitHubIndex.stars.toString() ?? "Default"),
              subtitle: Text(gitHubIndex.repoDescription),
              leading: CachedNetworkImage(
                imageUrl: gitHubIndex.avatherUrl,
              ),
              title: Text(gitHubIndex.repoName),
            ),
          );
        });
  }
}
