import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/home_page.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late String imagePath = '';

  List<String> indiaImages = [
    'assets/images/landing.jpg',
    'assets/images/jaipur.jpg',
    'assets/images/golden.jpg',
    'assets/images/tajmahal.jpg',
    'assets/images/monument.jpg',
    'assets/images/raghu.jpg',

    // Add more image URLs here
  ];

  @override
  void initState() {
    super.initState();
    // Select a random image URL when the widget is created
    imagePath = indiaImages[Random().nextInt(indiaImages.length)];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Indian News',
              textStyle: GoogleFonts.merriweather(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.yellow,
              ],
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true, // Center the title
      ),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(imagePath,
                width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/1.7,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10.0 ,),
            Center(
              child: Text('Stay Informed,Stay Inspired',
                  style:GoogleFonts.roboto(
                color:Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold
              )),
            ),
            const SizedBox(height: 10.0,),
            Text('     Explore the latest headlines and \n breaking news from around the world.',
                  style:GoogleFonts.roboto(
                      color:Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                  )),
            const SizedBox(height: 10.0,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Home()
                    ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width/1.2,
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation:5.0 ,
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    padding: const EdgeInsets.symmetric(vertical: 20 ),
                    decoration: BoxDecoration(
                        color:Colors.blue,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Center(
                      child:  Text('Get Started',style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
