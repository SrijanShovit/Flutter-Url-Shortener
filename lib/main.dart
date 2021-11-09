import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/Screens/url_shortener.dart';
import 'package:url_shortener/Screens/url_shortener_state.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => UrlShortenerState(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UrlShortenerPage(),
    );
  }
}
