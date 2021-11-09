import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/Screens/url_shortener_state.dart';

//Not using stateful widget bcz we ll be using provider for state management
class UrlShortenerPage extends StatelessWidget {
  const UrlShortenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortenerState>(context, listen: true);
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(32),
            width: double.infinity,
            child: Column(
              children: [
                Spacer(),
                Text(
                  "URL Shortener",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600]),
                ),
                Text("Shorten your long URL quickly",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: state.urlController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.transparent)),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Paste the link"),
                ),
                SizedBox(height: 16),
                Builder(
                  builder: (context) => GestureDetector(
                      onTap: () {
                        //function for copying text on tap
                        Clipboard.setData(
                                //this returns future
                                ClipboardData(text: state.shortUrlMessage))
                            .whenComplete(() =>
                                //here context below scaffold was needed so wrapped gest.det. in builder
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text("Link is copied"))));
                      },
                      child: Text(state.shortUrlMessage)),
                ),
                Spacer(),
                Container(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        state.handleGetLinkButton();
                      },
                      child: Text("Get Link"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ))
              ],
            )));
  }
}
