import 'package:flutter/material.dart';
import 'package:github_stars_app/src/screens/github_homepage.dart';
import 'package:github_stars_app/src/viewmodel/github_list_view_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChangeNotifierProvider(
            create: (context) => GithubListViewModel(), child: MyGitHubPage()));
  }
}
