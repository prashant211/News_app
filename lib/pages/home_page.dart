import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/catgeory_model.dart';
import '../services/news.dart';
import '../widgets/category_tile.dart';
import 'package:news_app/models/slider_model.dart';

import '../widgets/news_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _isLoading = true;
  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
     getSlider();
    super.initState();
    getNews();
  }

  getNews() async {
    News newsInstance = News(); // <-- Fix naming conflict
    await newsInstance.getNews();
    articles = newsInstance.news;
    setState(() {
      _isLoading = false;
    });
  }
  getSlider() async {
    Sliders slider = Sliders(); // <-- Fix naming conflict
    await slider.getSlider();
    sliders = slider.sliders;
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
            const Text('Indian',),
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
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News!',
                      style: GoogleFonts.lora(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        AllNews(news: 'Breaking')
                        )
                        );
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.lora(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String? res = sliders[index].urlToImage;
                    String? res1 = sliders[index].title;
                    return buildImage(res!, index, res1!);
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy:
                    CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  )),
              const SizedBox(height: 30,),
              Center(child: buildIndicator()),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending News!',
                      style: GoogleFonts.lora(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            AllNews(news: 'Trending')
                        )
                        );
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.lora(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return NewsWidget(
                        title: articles[index].title!,
                        imageUrl: articles[index].urlToImage!,
                        desc: articles[index].description!,
                      url: articles[index].url!,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 250,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.only(left: 10.0),
              margin: const EdgeInsets.only(top: 130.0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Text(
                maxLines: 2,
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 5,
    effect: const SlideEffect(
      dotColor: Colors.grey,
      activeDotColor: Colors.blue,
      dotWidth: 10.0,
      dotHeight: 10.0,
      spacing: 8.0,
    ),
  );
}


