import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_care_app/styleguide.dart';
import 'package:flutter_health_care_app/utils.dart';
import 'package:flutter_health_care_app/widgets/moods.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care',
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
  final userImage = "https://lh3.googleusercontent.com/proxy/CNEn2xdbSdgciZ_GyV48syGOva9kZmiXEKtPKN6Kyr5ppq2bUNpGJoqOrpYMH-mJqccqvr_V7nBjkYGocDrw3fIWoM5aqARAT55x";
  int _selectedIndex = 0;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            _buildTopStack(),

            SizedBox(height: 60,),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  _buildNotificationCard(),

                  _buildNextAppointmentTitle("Your Next Appointment"),

                  _buildNextAppointmentInfo(),

                  _buildNextAppointmentTitle("Specialists In Your Area"),

                  _buildAreaSpecialists(),

                  _buildAreaSpecialists(),

                  _buildAreaSpecialists(),

                ],
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [

          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.home, size: 30.0),
            title: Text("1"),
          ),

          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.search, size: 30.0),
            title: Text("1"),
          ),

          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.gratipay, size: 30.0),
            title: Text("1"),
          ),

        ],
        onTap: onTapped,
      ),

    );
  }

  Stack _buildTopStack() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        _buildBackgroundCover(),
        _buildGreetings(),
        _buildMoodsHolder(),
      ],
    );
  }

  _buildBackgroundCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  _buildGreetings() {
    return Positioned(
      left: 20.0,
      bottom: 90.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            "Hi Vitor",
            style: greetingTitleStyle,
          ),

          SizedBox(height: 10,),

          Text(
            "How are you feeling today?",
            style: greetingSubtitleStyle,
          ),

        ],
      ),
    );
  }

  _buildMoodsHolder() {
    return Positioned(
      bottom: -45,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
          boxShadow: [BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.5,
            blurRadius: 5.5,
          )],
        ),
        child: MyMoods(),
      ),
    );
  }

  _buildNotificationCard() {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        leading: Icon(
          LineAwesomeIcons.calendar_check_o,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          "Your visit with \nDr Mukomberoh",
          style: notificationTitleStyle,
        ),
        trailing: OutlineButton(
          onPressed: () {},
          color: Colors.transparent,
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Text(
            "Review",
            style: notificationButtonStyle,
          ),
        ),
      ),
    );
  }

  _buildNextAppointmentTitle(title) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Text(
            title,
            style: nextAppointmentTitleStyle,
          ),

          Text(
            "See All",
            style: nextAppointmentSubtitleStyle,
          ),

        ],
      ),
    );
  }

  _buildNextAppointmentInfo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(userImage),
                radius: 36,
              ),

              SizedBox(width: 12,),

              RichText(
                text: TextSpan(
                  text: "Dr Handi Cloak",
                  style: appointmentMainStyle,
                  children: [

                    TextSpan(
                      text: "\nSunday.May 5th at 8:00 am",
                      style: appointmentDateStyle,
                    ),

                    TextSpan(
                      text: "\n570 Kyemmer Stores \nNairobi Kenya -C 4 Avenue",
                      style: appointmentVenueDateStyle,
                    ),

                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 8,),

          Divider(
            color: Colors.grey[200],
            height: 3,
            thickness: 1,
          ),

          SizedBox(height: 8,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              _iconBuilder(LineAwesomeIcons.check_circle, "Check In"),
              _iconBuilder(LineAwesomeIcons.times_circle, "Cancel"),
              _iconBuilder(LineAwesomeIcons.calendar_times_o, "Calender"),
              _iconBuilder(LineAwesomeIcons.compass, "Directions"),

            ],
          ),

        ],
      ),
    );
  }

  _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 38,
          color: Colors.black,
        ),

        SizedBox(height: 8,),

        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),

      ],
    );
  }

  _buildAreaSpecialists() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      margin: EdgeInsets.only(bottom: 20,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1.0,
          blurRadius: 6.0,
        )],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(userImage),
                radius: 36,
              ),

              SizedBox(width: 10,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  RichText(
                    text: TextSpan(
                      text: 'wellness\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: [

                        TextSpan(
                          text: "Dr Ayor Kruger",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        TextSpan(
                          text: "\nPoplar Pharma Limited",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        TextSpan(
                          text: "\nDermatologist \nSan Francisco CA | 5 min",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 6,),

                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: purpleGradient,
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: 36,
                          minWidth: 88,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Book Visit",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),

          Icon(
            LineAwesomeIcons.heart,
            color: lightColor,
            size: 36,
          ),

        ],
      ),
    );
  }
}
