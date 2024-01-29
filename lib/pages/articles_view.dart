import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  ArticleView({super.key, required this.blogUrl});

  String blogUrl;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Indian'),
            Text(
              'News',
              style: GoogleFonts.merriweather(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.blogUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (value) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
             const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
