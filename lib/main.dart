import 'package:flutter/material.dart';
import 'package:tour_guide/data/app_data.dart';
import 'package:tour_guide/models/Trip.dart';
import 'package:tour_guide/screens/bottom_bar.dart';
import 'package:tour_guide/screens/favirote.dart';
import 'package:tour_guide/screens/filter.dart';
import 'package:tour_guide/screens/tripscreen.dart';
import '../screens/categorys_types.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Trip> _availabletrip = Trips_data;
  List<Trip> _favoritetrips = [];

  changefilter(Map<String, bool> newfilter) {
    setState(() {
      _filter = newfilter;

      _availabletrip = Trips_data.where((trip) {
        if (_filter['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filter['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filter['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  addfavorite(idtrip) {
    Trip fftip = Trips_data.firstWhere((trip) => trip.id == idtrip);
    if (_favoritetrips.contains(fftip)) {
      _favoritetrips.remove(fftip);
    } else {
      _favoritetrips.add(fftip);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      //home: bottombar(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => bottombar(_filter, changefilter, _favoritetrips),
        'home': (context) => home(),
        'types': (context) => categorytyps(_availabletrip),
        'trips': (context) => tripscreen(addfavorite, _favoritetrips),
        'favorite': (context) => faviorte(_favoritetrips),
        filter.screenRoute: (context) => filter(
              _filter,
              changefilter,
            ),
      },
    );
  }
}
