import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/articles_view.dart';

class NewsWidget extends StatelessWidget {
   NewsWidget({
     super.key,
     required this.title,
     required this.imageUrl,
     required this.desc,
     required this.url});

  String imageUrl;
  String title;
  String desc;
  String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ArticleView(blogUrl:url
                ),
            ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10,bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:CachedNetworkImage (
                       imageUrl: imageUrl,
                        height: 120,
                        width:120,
                        fit:BoxFit.cover ,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.2,
                        child:  Text(title,
                          maxLines: 2,
                          style:GoogleFonts.exo2(
                            color: Colors.black,fontWeight: FontWeight.w500,
                            fontSize: 17
                        ),
                        ),
                      ),
                      const SizedBox(height: 7.0,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.2,
                        child:  Text(desc,
                          maxLines: 3,
                          style: GoogleFonts.exo2(
                            color: Colors.black54,fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
