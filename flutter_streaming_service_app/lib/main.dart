import 'package:flutter/material.dart';
import 'package:flutter_streaming_service_app/customicon.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFE52020)),
            title: Text("Home", style: TextStyle(color: Color(0xFFE52020))),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            title: Text("Search",),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border,),
            title: Text("Bookmark",),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,),
            title: Text("Profile",),
          ),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/images/banner.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333),
                        ],
                        stops: [
                          0.0,
                          0.9,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120.0, left: 95.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "WATCH BEFORE EVERONE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "SF-Pro-Display-Bold",
                            ),
                          ),
                          Text(
                            "The Punisher: Season 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontFamily: "SF-Pro-Display-Bold",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 370.0,
            right: -20,
            child: FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: Row(
                children: <Widget>[

                  FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFE52020),
                    ),
                  ),

                  SizedBox(width: 12,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: RaisedButton(
                      onPressed: (){},
                      color: Color(0xFFE52020),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Watch Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: "SF-Pro-Display-Bold",
                            ),
                          ),
                          SizedBox(width: 5,),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              CustomIcons.back_icon,
                              size: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class HomeScreenBottomPart extends StatelessWidget {
  final List<String> images = [
    "assets/images/runaways.jpg",
    "assets/images/avengers.jpg",
    "assets/images/blackpanther.jpg",
  ];

  final List<String> titles = ["Runaways", "Avengers: Infinity War", "Black Panther"];

  List<Widget> movies() {
    List<Widget> movieList = List();

    for(int i = 0; i < images.length; i++) {
      var movieItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
        child: Container(
          height: 220,
          width: 135,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10),
            )]
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 135,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, left: 8, right: 8),
                child: Text(
                  titles[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "SF-Pro-Display-Bold",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(i == 0 ? "Season 2" : ""),
              ),
            ],
          ),
        ),
      );

      movieList.add(movieItem);
    }

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      margin: EdgeInsets.only(left: 65),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Watch now",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "SF-Pro-Display-Bold",
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("View more"),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          ),
        ],
      ),
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);
    
    path.quadraticBezierTo(
      controlpoint.dx,
      controlpoint.dy,
      endpoint.dx,
      endpoint.dy,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
