import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_shortener/model/url_shortener_model.dart';

class UrlShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();

  String shortUrlMessage = "Provide a long URL to convert";
  handleGetLinkButton() async {
    final longUrl = urlController.text;
    final String shortUrl = await getShortLink(longUrl);
    shortUrlMessage = "$shortUrl";

    //to update UI on updating here call notifyListener
    notifyListeners();
  }

  Future<String> getShortLink(String longUrl) async {
    final result = await http
        .post(Uri.parse("https://cleanuri.com/api/v1/shorten"), body: {
      "url": longUrl,
    });

    if (result.statusCode == 200) {
      print("Successfully completed");
      print(result.body);
      //we have to parse our response
      final response = urlShortenerResponseFromJson(result.body);
      return response.resultUrl;
    } else {
      print("Error");
      print(result.body);
      return "Error";
    }
  }
}


//Steps of using provider
//1.Write ur widget UI as usual.
//2.Make a class extending the change notifier
//3.Wrap My App with provider to make it available everywhere
//4.use property create an return instance of that class where notifier code is there
//5.Now this instance can be used anywhere in app
//6.MAke   referece to provider where it needs to be used and specify type of provider
//7.Can keep listen to true if we want changes in this class to be reflected there
