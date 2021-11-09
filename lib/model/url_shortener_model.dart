import 'dart:convert';

UrlShortenerResponse urlShortenerResponseFromJson(String str) =>
    UrlShortenerResponse.fromJson(json.decode(str));

String urlShortenerResponseToJson(UrlShortenerResponse data) =>
    json.encode(data.toJson());

class UrlShortenerResponse {
  UrlShortenerResponse({
    required this.resultUrl,
  });

  String resultUrl;

  factory UrlShortenerResponse.fromJson(Map<String, dynamic> json) =>
      UrlShortenerResponse(
        resultUrl: json["result_url"],
      );

  Map<String, dynamic> toJson() => {
        "result_url": resultUrl,
      };
}
