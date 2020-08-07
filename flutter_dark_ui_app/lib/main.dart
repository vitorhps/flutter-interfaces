import 'package:flutter/material.dart';
import 'package:flutter_dark_ui_app/style.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dark UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(
                "Todays Goal",
                style: titleStyle,
              ),

              SizedBox(height: 14,),

              Text(
                "Enjoy daily habbits, Exercise and tips \nfor body and your mental health.",
                style: subtitleStyle,
              ),

              SizedBox(height: 32,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  _buildSoftUIMenu(
                    Icons.directions_walk,
                    Colors.cyanAccent,
                    "Walking",
                  ),

                  _buildSoftUIMenu(
                    LineAwesomeIcons.star_half_empty,
                    Colors.deepOrangeAccent,
                    "Sleeping",
                  ),

                  _buildSoftUIMenu(
                    LineAwesomeIcons.bicycle,
                    Colors.lightGreenAccent,
                    "Biking",
                  ),

                ],
              ),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  _buildSoftUIMenu(
                    LineAwesomeIcons.glass,
                    Colors.lightBlueAccent,
                    "Water",
                  ),

                  _buildSoftUIMenu(
                    LineAwesomeIcons.dot_circle_o,
                    Colors.deepOrangeAccent,
                    "Food",
                  ),

                  _buildSoftUIMenu(
                    LineAwesomeIcons.y_combinator,
                    Colors.yellowAccent,
                    "Yoga",
                  ),

                ],
              ),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  _buildSoftUIMenu(
                    LineAwesomeIcons.level_up,
                    Colors.red,
                    "Blood",
                  ),

                  _buildSoftUIMenu(
                    LineAwesomeIcons.warning,
                    Colors.deepOrangeAccent,
                    "Energy",
                  ),

                  _buildSoftUIMenu(
                    LineAwesomeIcons.object_group,
                    Colors.redAccent,
                    "Gym",
                  ),

                  SizedBox(height: 20,),

                ],
              ),
              
            ],
          ),
        ),
      ),

      bottomNavigationBar: FixedBottomBar(),

    );
  }
}

Widget _buildSoftUIMenu(icon, color, title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[

      Container(
        height: 90,
        width: 90,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: lightColor.withOpacity(0.1),
              offset: Offset(-6, -6),
              spreadRadius: 0,
              blurRadius: 6,
            ),
            BoxShadow(
              color: Colors.black26,
              offset: Offset(6, 6),
              spreadRadius: 0,
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: 46,
            color: color,
          ),
        ),
      ),

      Text(
        title,
        style: subtitleStyle,
      ),

    ],
  );
}

class FixedBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
      child: MaterialButton(
        height: 50,
        textColor: Colors.black,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Text(
          "CONTINUE",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}