import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/articles_view.dart';
import 'package:news_app/widgets/news_widget.dart';
class ShowCategory extends StatelessWidget {
   ShowCategory({super.key,
     required this.title,
     required this.desc,
     required this.image,
      required this.url});

    String image,desc,title,url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ArticleView(blogUrl: url)
            ),
        );
      },
      child: Container(
        child: Column(
          children: [
            CachedNetworkImage(imageUrl:image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(title,
              maxLines: 2,
              style: const TextStyle(color: Colors.black,
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
            ),
            Text(desc,maxLines: 3,style: const TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w500
            ),
            ),
            const SizedBox(height: 5.0,),
          ],
        ),
      ),
    );
  }
}
