import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/category.dart';

class ShowCategoryNews{
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String category) async{
    String url = 'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=43c3c89187604f8298ff2996e34f81dc';
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            content: element['content'],
          );
          categories.add(categoryModel);
        }
      });
    }
  }
}