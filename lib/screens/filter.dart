import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:tour_guide/data/const.dart';
import 'package:tour_guide/screens/bottom_bar.dart';

class filter extends StatefulWidget {
  static const screenRoute = 'filter';
  Function savefilter;
  final Map<String, bool> currentfilter;
  filter(
    this.currentfilter,
    this.savefilter,
  );

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  bool _isSummer = false;
  bool _iswinter = false;
  bool _isfamily = false;
  @override
  void initState() {
    // TODO: implement initState
    _isSummer = widget.currentfilter['summer']!;
    _iswinter = widget.currentfilter['winter']!;
    _isfamily = widget.currentfilter['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          /* switchmethod(
              "The Summer Trips just", "Show The Summer Trips just", _isSummer,
              (newvalue) {
            setState(() {
              _isSummer = newvalue;
            });
          }, AssetImage("assets/images/sun.png"),
              AssetImage("assets/images/sun.png"), Colors.orange),
          switchmethod(
              "The Winter Trips just", "Show The Winter Trips just", _iswinter,
              (newvalue) {
            setState(() {
              _iswinter = newvalue;
            });
          }, AssetImage("assets/images/snow.png"),
              AssetImage("assets/images/snow.png"), Colors.lightBlueAccent),
          switchmethod(
              "The Family Trips just", "Show The Family Trips just", _isfamily,
              (newvalue) {
            setState(() {
              _isfamily = newvalue;
            });
          }, AssetImage("assets/images/family.png"),
              AssetImage("assets/images/family.png"), Colors.pink),
          SizedBox(
              // height: 100,
              ), */
          newswitch(
              "The Summer Trips just", "Show The Summer Trips just", _isSummer,
              (newvalue) {
            setState(() {
              _isSummer = newvalue;
            });
          }, Icons.sunny, Icons.wb_sunny_outlined, Colors.orange,
              Colors.orangeAccent[200], "Summer"),
          newswitch(
              "The Winter Trips just", "Show The Winter Trips just", _iswinter,
              (newvalue) {
            setState(() {
              _iswinter = newvalue;
            });
          }, Icons.cloudy_snowing, Icons.wb_cloudy_outlined, Colors.blue,
              Colors.lightBlueAccent[200], "Winter"),
          newswitch(
              "The Family Trips just", "Show The Family Trips just", _isfamily,
              (newvalue) {
            setState(() {
              _isfamily = newvalue;
            });
          }, Icons.family_restroom, Icons.family_restroom, Colors.pink,
              Colors.pinkAccent, "Family"),
          SizedBox(
            height: 50,
          ),
          Container(
            //margin: EdgeInsets.symmetric(horizontal: 100),
            /* decoration: BoxDecoration(
              //color: primcol,
              borderRadius: BorderRadius.circular(8),
            ), */
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 110),
            child: MaterialButton(
              padding: EdgeInsets.all(8),
              color: primcol,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                final selectfilter = {
                  'summer': _isSummer,
                  'winter': _iswinter,
                  'family': _isfamily,
                };
                widget.savefilter(selectfilter);
                Navigator.of(context).pushNamed('/');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: const [
                    Icon(
                      Icons.save_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget newswitch(
      String title,
      String subtitle,
      bool value,
      Function(bool) updatevalue,
      activicon,
      inactiveicon,
      acolor,
      inacolor,
      textfilter) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 270,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black54),
                ),
              ]),
        ),
        Expanded(
          child: LiteRollingSwitch(
            width: MediaQuery.of(context).size.width - 290,
            //initial value
            onSwipe: () {},
            onDoubleTap: () {},
            onTap: () {},
            value: value,
            textOn: textfilter,
            textOff: '',
            colorOn: acolor,
            colorOff: inacolor,
            iconOn: activicon,
            iconOff: inactiveicon,
            textSize: 12.0,
            textOnColor: Colors.white,
            onChanged: updatevalue,
            animationDuration: Duration(milliseconds: 200),
          ),
        ),
      ]),
    );
  }

  Widget switchmethod(String title, String subtitle, bool value,
      Function(bool)? updatevalue, activimage, inactiveimage, acolor) {
    return SwitchListTile(
      activeThumbImage: activimage,
      inactiveThumbImage: inactiveimage,
      activeColor: acolor,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      onChanged: updatevalue!,
      value: value,
    );
  }
}
