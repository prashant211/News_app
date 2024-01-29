import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/category_news.dart';
class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key,required this.image,required this.categoryName});

  final image,categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        CategoryNews(categoryName: categoryName)
        ));
      },
      child: Container(
        margin: const  EdgeInsets.only(right: 16.0),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child:
              Image.asset(image ,
                width:120,
                height: 60,
                fit: BoxFit.cover,
              ),
          ),
          Container(
          width: 120,
          height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,),
              child :Center(
                child: Text(categoryName,
                    style: GoogleFonts.vollkorn(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )
                    ),
              ),
      ),
      ],
        ),
      ),
    );
  }
}
