import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({required this.url, Key? key}) : super(key: key);
  @override
  WebViewPageState createState() => WebViewPageState();

  final String url;
}

class WebViewPageState extends State<WebViewPage> {
  WebViewController? _controller;

  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: FloatingActionButton(
            backgroundColor: primaryBlue,
            onPressed: () => _goBack(context),
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controllerCompleter.future.then((value) => _controller = value);
              _controllerCompleter.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    bool? goBack = await _controller?.canGoBack();
    log("can go back: $goBack");
    if (goBack != true) {
      Get.back();
      return Future.value(true);
    }
    if (goBack!) {
      log("can go back");
      _controller!.goBack();
      return Future.value(false);
    } else {
      log("Else");
      return Future.value(true);
    }
  }
}
