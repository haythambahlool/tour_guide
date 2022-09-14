import 'package:flutter/material.dart';
import 'package:tour_guide/screens/filter.dart';
import '../widgets/trip_card.dart';
import '../data/const.dart';
import '../data/app_data.dart';
import '../models/Trip.dart';

class categorytyps extends StatefulWidget {
  categorytyps(this.availabletrip);
  List<Trip> availabletrip;
  @override
  State<categorytyps> createState() => _categorytypsState();
}

class _categorytypsState extends State<categorytyps> {
  String? title;
  List<Trip>? filter;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final argumentroute =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = argumentroute['id'];
    title = argumentroute['title'];
    filter = widget.availabletrip.where((trip) {
      return trip.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  _remove(String tripid) {
    setState(() {
      filter!.removeWhere((element) => element.id == tripid);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Season s=filter[0].season ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primcol,
        title: Center(
          child: Text(
            title!.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: "Quicksand",
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return tripcard(
            id: filter![index].id,
            imgurl: filter![index].imageUrl,
            title: filter![index].title,
            duration: filter![index].duration,
            //triptype: filter[index].tripType ,
            //season:  filter[index].season,
          );
        },
        itemCount: filter!.length,
      ),
    );
  }
}
