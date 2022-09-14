import 'package:flutter/material.dart';
import 'package:tour_guide/data/app_data.dart';
import 'package:tour_guide/data/const.dart';
import 'package:tour_guide/models/Trip.dart';

class tripscreen extends StatelessWidget {
  const tripscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripid =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final trips = Trips_data.firstWhere((trip) => trip.id == tripid["id"]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primcol,
        title: Center(
            child: Text(
          "${trips.title}",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              width: double.infinity,
              child: Image.network(
                trips.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                //vertical: 10,
              ),
              child: Text(
                "Activites",
                style: TextStyle(
                    color: primcol, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: trips.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: .5,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Text(
                      '${trips.activities[index]}',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                //vertical: 10,
              ),
              child: Text(
                "Program Day",
                style: TextStyle(
                    color: primcol, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                  itemCount: trips.program.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            title: Text(
                              "${trips.program[index]}",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: primcol,
                              child: Text(
                                "Day${index + 1}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            endIndent: 20,
                            indent: 20,
                          )
                        ],
                      )),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: seccol,
        onPressed: () {
          Navigator.of(context).pop(tripid['id']);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
