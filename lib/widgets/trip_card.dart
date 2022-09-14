//import 'dart:ffi';

import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../data/const.dart';
import '../models/trip.dart';

class tripcard extends StatefulWidget {
  final String imgurl;
  final String title;
  final int duration;
  final String id;
  // final TripType triptype;
  //final Season season;
  tripcard({
    required this.imgurl,
    required this.title,
    required this.duration,
    required this.id,
    //required this.triptype,
    //required this.season,
  });

  @override
  State<tripcard> createState() => _tripcardState();
}

class _tripcardState extends State<tripcard> {
/* 
  String get seasontext {
    switch (season) {
      case Season.Winter:
        return "winter";
        break;
      case Season.Autumn:
        return "Autumn";
        break;
      case Season.Summer:
        return "Summer";
        break;

      case Season.Spring:
        return "Spring";
        break;
      default:
        return "undefined";
    }
  }

  String get triptext {
    switch (triptype) {
      case TripType.Activities:
        return "Activities";
        break;
      case TripType.Exploration:
        return "Exploration";
        break;
      case TripType.Recovery:
        return "Recovery";
        break;
      case TripType.Therapy:
        return "Therapy";
        break;
      default:
        return "undefined";
    }
  } */
  @override
  Widget build(BuildContext context) {
    final filter = Trips_data.where((trip) {
      return trip.categories.contains(widget.id);
    }).toList();
    return InkWell(
      onTap: () async {
        await Navigator.of(context)
            .pushNamed("trips", arguments: {"id": widget.id});
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imgurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 1]),
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: seccol,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.duration} Days",
                        style: TextStyle(
                            color: seccol, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: seccol,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.duration} Days",
                        style: TextStyle(
                            color: seccol, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: seccol,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.duration} Days",
                        style: TextStyle(
                            color: seccol, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
