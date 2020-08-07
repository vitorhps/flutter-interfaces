import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  final double _smallFontSize = 12.0;
  final double _valFontSize = 30.0;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final Color _fontColor = Color(0xff5b6990);
  final double _smallFontSpacing = 1.3;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "6.45h",
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "AVERAGE SLEEP",
                    style: TextStyle(
                      fontWeight: _smallFontWeight,
                      fontSize: _smallFontSize,
                      letterSpacing: _smallFontSpacing,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "6.45h",
                    style: TextStyle(
                      fontWeight: _valFontWeight,
                      fontSize: _valFontSize,
                      color: _fontColor,
                    ),
                  ),
                  SizedBox(height: 30,),

                ],
              ),

              Container(
                height: 180,
                width: 180,
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xfff0f5fb),
                  border: Border.all(
                    width: 8,
                    color: Color(0xffd3e1ed),
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      "THIS WEEK",
                      style: TextStyle(
                        fontSize: _smallFontSize,
                        fontWeight: _smallFontWeight,
                        letterSpacing: _smallFontSpacing,
                        color: _fontColor,
                      ),
                    ),

                    SizedBox(height: 15,),

                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: CustomPaint(
                        foregroundPainter: GraphPainter(),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 35,),

          RecordItem(
            day: "SUNDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),
          RecordItem(
            day: "MONDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),
          RecordItem(
            day: "TUESDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),
          RecordItem(
            day: "WEDNESDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),
          RecordItem(
            day: "THURSDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),
          RecordItem(
            day: "FRIDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),
          RecordItem(
            day: "SATURDAY",
            fontColor: _fontColor,
            smallFontSpacing: _smallFontSpacing,
          ),

        ],
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  Paint trackBarPaint = Paint()
    ..color = Color(0xff818aab)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  Paint trackPaint = Paint()
    ..color = Color(0xffdee6f1)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 12;

  @override
  void paint(Canvas canvas, Size size) {
    List val = [
      size.height * 0.8,
      size.height * 0.5,
      size.height * 0.9,
      size.height * 0.8,
      size.height * 0.5,
    ];
    double origin = 8;

    Path trackBarPath = Path();
    Path trackPath = Path();

    for (int i = 0; i < val.length; i++) {
      trackPath.moveTo(origin, size.height);
      trackPath.lineTo(origin, 0);

      trackBarPath.moveTo(origin, size.height);
      trackBarPath.lineTo(origin, val[i]);


      origin = origin + size.width * 0.22;
    }

    canvas.drawPath(trackPath, trackPaint);
    canvas.drawPath(trackBarPath, trackBarPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RecordItem extends StatelessWidget {
  const RecordItem({
    Key key,
    @required String day,
    @required Color fontColor,
    @required double smallFontSpacing,
  }) : _day = day, _fontColor = fontColor, _smallFontSpacing = smallFontSpacing, super(key: key);

  final String _day;
  final Color _fontColor;
  final double _smallFontSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffdde9f7),
            width: 1.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
            _day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _fontColor,
            ),
          ),

          SizedBox(height: 15,),

          Row(
            children: <Widget>[

              Text(
                "02/21/2020",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: _smallFontSpacing,
                  color: _fontColor,
                ),
              ),

              SizedBox(width: 35,),

              Expanded(
                child: Text(
                  "45.3 MINUTES",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: _smallFontSpacing,
                    color: _fontColor,
                  ),
                ),
              ),
              
            ],
          ),

        ],
      ),
    );
  }
}