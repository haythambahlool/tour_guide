import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/models/Trip.dart';
import 'package:tour_guide/screens/categorys_types.dart';
import 'package:tour_guide/screens/favirote.dart';
import 'package:tour_guide/screens/filter.dart';
import 'package:tour_guide/screens/home_screen.dart';
import 'package:tour_guide/widgets/trip_card.dart';

import '../data/const.dart';

class bottombar extends StatefulWidget {
  bottombar(this._currentfilter, this.savefilter, this.favoritetr);
  Function savefilter;
  final Map<String, bool> _currentfilter;
  List<Trip> favoritetr;

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  int _currenindex = 1;
  Function? sfilter;
  late final Map<String, bool> ccfilter;
  late final List<Map<String, Widget?>> _screens;

  @override
  void initState() {
    _screens = [
      {
        "screen": faviorte(widget.favoritetr),
        "title": Text(
          "Favorite",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Quicksand",
          ),
        ),
      },
      {
        "screen": const home(),
        "title": Text(
          "Tour Guide",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Quicksand",
          ),
        ),
      },
      {
        "screen": filter(widget._currentfilter, widget.savefilter),
        "title": Text(
          "Filter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Quicksand",
          ),
        ),
      },
    ];
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currenindex]['screen'],
      extendBody: true,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: primcol,
        title: Center(child: _screens[_currenindex]['title']),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        onTap: (index) {
          setState(() {
            _currenindex = index;
          });
        },
        index: _currenindex,
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: seccol,
        color: primcol,
        items: <Widget>[
          if (_currenindex == 0)
            (Icon(
              Icons.star,
              color: Colors.white,
            ))
          else
            (Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Text(
                    "Favorite",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )),
          if (_currenindex == 1)
            (Icon(
              Icons.dashboard,
              color: Colors.white,
            ))
          else
            (Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                children: [
                  Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )),
          if (_currenindex == 2)
            (Icon(
              Icons.filter_list,
              color: Colors.white,
            ))
          else
            (Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                children: [
                  Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                  Text(
                    "Filter",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )),
        ],
      ),
    );
  }
}
