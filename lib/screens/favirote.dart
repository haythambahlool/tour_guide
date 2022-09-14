import 'package:flutter/material.dart';
import '../models/Trip.dart';
import '../widgets/trip_card.dart';

class faviorte extends StatefulWidget {
  faviorte(this.favoritetrip);
  List<Trip> favoritetrip;

  @override
  State<faviorte> createState() => _faviorteState();
}

class _faviorteState extends State<faviorte> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoritetrip.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/earth.png",
              height: 250,
              width: double.infinity,
            ),
            Container(
              width: 300,
              child: const Text(
                "Looks like you don't have any favorites trips yet!",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 70),
              itemBuilder: (context, index) {
                return tripcard(
                  id: widget.favoritetrip[index].id,
                  imgurl: widget.favoritetrip[index].imageUrl,
                  title: widget.favoritetrip[index].title,
                  duration: widget.favoritetrip[index].duration,
                  //triptype: widget.favoritetrip[index].tripType ,
                  //season:  filter[index].season,
                );
              },
              itemCount: widget.favoritetrip.length,
            ),
          ),
        ],
      );
    }
  }
}
