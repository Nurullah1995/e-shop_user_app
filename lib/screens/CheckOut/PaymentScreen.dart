//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//
//
//class PymentRecivePage extends StatefulWidget {
//  final String  weburl;
//  PymentRecivePage(this.weburl);
//  @override
//  _PymentRecivePageState createState() => _PymentRecivePageState();
//}
//
//class _PymentRecivePageState extends State<PymentRecivePage> {
//  WebViewController _webViewController;
//  bool showLoading = false;
//
//  void updateLoading(bool ls) {
//    this.setState((){
//      showLoading = ls;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child:  WebView(
//          initialUrl: widget.weburl,
//          onPageFinished: (data){
//            updateLoading(false);
//          },
//          javascriptMode: JavascriptMode.unrestricted,
//          onWebViewCreated: (webViewController){
//            _webViewController = webViewController;
//          },
//        ),
//      ),
//
//    );
//  }
//}
