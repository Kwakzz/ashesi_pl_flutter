// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';




/// This is used for in-app web pages
class WebPage extends StatelessWidget {

  // This is used for in-app web pages
  WebPage(
    {
      super.key,
      required this.url,
      required this.pageName
    }
  );

  final String url;
  final String pageName;

  final Completer<WebViewController> _controller = Completer<WebViewController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBarWithPrevButton(
        title: pageName,
        prevContext: context,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      )
    );
      
  }
}


