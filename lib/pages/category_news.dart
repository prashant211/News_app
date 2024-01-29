import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/services/show_caetgory_news.dart';

import '../widgets/show_category.dart';

class CategoryNews extends StatefulWidget {
  CategoryNews({super.key,required this.categoryName});

  String categoryName;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }



  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews(); // <-- Fix naming conflict
    await showCategoryNews.getCategoryNews(widget.categoryName.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(widget.categoryName),
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ShowCategory(
                image: categories[index].urlToImage!,
                title: categories[index].title!,
                desc: categories[index].description! ,
                url: categories[index].url!,
              );
            }),
      )
      );
  }
}
