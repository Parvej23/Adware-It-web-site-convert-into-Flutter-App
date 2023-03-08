import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late InAppWebViewController webView;
  double _progress=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Adware IT'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse("https://adwareit.com")),
              onWebViewCreated: (InAppWebViewController controller){
                webView= controller;
              },
              onLoadStart: (controller, url){},
              onProgressChanged: (InAppWebViewController controller, int progress){
                setState(() {
                  _progress=progress/100;
                });
              },
            ),
            _progress<1? SizedBox(height: 3, child: LinearProgressIndicator(
              value: _progress,
                backgroundColor: Colors.orange.withOpacity(0.2),
            ),):SizedBox()
          ],
        ),
      ),
    );
  }
}

