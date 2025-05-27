import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatefulWidget {
  final String url;

  const NewsWebViewScreen({super.key, required this.url});

  @override
  State<NewsWebViewScreen> createState() => _NewsWebViewScreenState();
}

class _NewsWebViewScreenState extends State<NewsWebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Details')),
      body: WebViewWidget(controller: controller),
    );
  }
}
