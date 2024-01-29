import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/all_widget.dart';

import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/news.dart';
import '../services/slider.dart';
class AllNews extends StatefulWidget {
   AllNews({super.key,required this.news});
     String news;
  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];

  @override
  void initState() {
    getSlider();
    super.initState();
    getNews();
    setState(() {

    });
  }

  getNews() async {
    News newsInstance = News(); // <-- Fix naming conflict
    await newsInstance.getNews();
    articles = newsInstance.news;
    setState(() {

    });
  }
  getSlider() async {
    Sliders slider = Sliders(); // <-- Fix naming conflict
    await slider.getSlider();
    sliders = slider.sliders;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.news}News',
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.news == 'Breaking' ? sliders.length : articles.length,
            itemBuilder: (context, index) {
              return AllNewsWidget(
                  title: widget.news =='Breaking' ? sliders[index].title! : articles[index].title!,
                  desc: widget.news =='Breaking' ? sliders[index].description! : articles[index].description!,
                  image: widget.news =='Breaking' ? sliders[index].urlToImage! : articles[index].urlToImage!,
                  url: widget.news =='Breaking' ? sliders[index].url! : articles[index].url!
              );
            }),
      ),
    );
  }
}
