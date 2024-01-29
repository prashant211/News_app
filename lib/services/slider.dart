import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:news_app/models/slider_model.dart';
class Sliders{
  List<SliderModel> sliders = [];

  Future<void> getSlider() async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=43c3c89187604f8298ff2996e34f81dc';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          SliderModel sliderModel = SliderModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            content: element['content'],
          );
          sliders.add(sliderModel);
        }
      });
    }
  }
}