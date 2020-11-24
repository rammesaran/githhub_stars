import 'package:flutter/material.dart';
import 'package:github_stars_app/src/screens/flutter.dart';

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
      home: OverFlow(),
    );

    // ChangeNotifierProvider(
    //     create: (context) => GithubListViewModel(), child: MyGitHubPage()));
  }
}
