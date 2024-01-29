import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=43c3c89187604f8298ff2996e34f81dc';
  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);

  if(jsonData['status'] == 'ok'){
    jsonData['articles'].forEach((element){
      if(element['urlToImage']!=null && element['description']!=null){
        ArticleModel articleModel = ArticleModel(
            title: element['title'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          author: element['author'],
           content: element['content'],
        );
        news.add(articleModel);
      }
    });
  }
  }
}