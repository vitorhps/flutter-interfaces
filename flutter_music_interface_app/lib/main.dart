import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildRadialSeekBar() {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        customColors: CustomSliderColors(
          trackColor: Colors.red.withOpacity(0.5),
          progressBarColor: Color(0xfffe1483),
          dotColor: Color(0xfffe1483),
          hideShadow: true,
        ),
        customWidths: CustomSliderWidths(
          trackWidth: 2.0,
          progressBarWidth: 5.0,
          handlerSize: 10.0,
        ),
        startAngle: 270.0,
        angleRange: 360.0,
        infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(
            color: Colors.transparent,
          ),
        ),
      ),
      min: 0,
      max: 1000,
      initialValue: 100,
      onChange: (double value) {}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFFE1483),
          ),
          onPressed: () {},
        ),
        title: Text(
          "Music World",
          style: TextStyle(
            color: Color(0xFFFE1438),
            fontFamily: "Nexa",
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFFFE1483),
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            SizedBox(height: 25,),

            Container(
              width: 250.0,
              height: 250.0,
              child: Stack(
                children: <Widget>[

                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xFFFE1483).withOpacity(.5),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: _buildRadialSeekBar(),
                    ),
                  ),

                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: ClipOval(
                          clipper: MClipper(),
                          child: Image.asset(
                            "assets/justine.jpg",
                            fit: BoxFit.cover,
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 30,),

            Column(
              children: <Widget>[

                Text(
                  "Justin Bieber fit. Never say",
                  style: TextStyle(
                    color: Color(0xFFFE1483),
                    fontSize: 20,
                    fontFamily: "Nexa",
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "The Weeknd",
                  style: TextStyle(
                    color: Color(0xFFFE1483),
                    fontSize: 18,
                    fontFamily: "NexaLight",
                  ),
                ),

              ],
            ),

            SizedBox(height: 5,),

            Container(
              width: 350,
              height: 150,
              child: Stack(
                children: <Widget>[

                  Center(
                    child: Container(
                      height: 65,
                      width: 290,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFFE1483),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: <Widget>[

                            Icon(
                              Icons.fast_rewind,
                              size: 55,
                              color: Color(0xFFFE1483),
                            ),

                            Expanded(
                              child: Container(),
                            ),

                            Icon(
                              Icons.fast_forward,
                              size: 55,
                              color: Color(0xFFFE1483),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        color: Color(0xFFFE1483),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),

            Container(
              height: 190,
              width: double.infinity,
              child: Stack(
                children: <Widget>[

                  Positioned(
                    left: -25,
                    child: Container(
                      width: 50,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Color(0xFFFE1483),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: -25,
                    child: Container(
                      width: 50,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Color(0xFFFE1483),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        song("assets/cover_01.jpg", "Never say", "Belive 2012"),
                        song("assets/cover_02.jpg", "Beauty...", "Belive 2012"),
                        song("assets/cover_03.png", "Boyfriend", "Belive 2012"),
                        
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}

Widget song(String image, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Image.asset(
          image,
          width: 40,
          height: 40,
        ),

        SizedBox(width: 8,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
              title,
              style: TextStyle(
                color: Color(0xFFFE1483),
              ),
            ),

            Text(
              subtitle,
              style: TextStyle(
                color: Color(0xFFFE1483),
              ),
            ),
            
          ],
        ),
        
      ],
    ),
  );
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}