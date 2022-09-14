import 'package:flutter/material.dart';
import 'package:tour_guide/data/const.dart';

class category_card extends StatelessWidget {
  final String img;
  final String title;
  final String id;

  void selectcategory(ctx) {
    Navigator.of(ctx).pushNamed('types', arguments: {'id': id, 'title': title});
  }

  const category_card(
      {Key? key, required this.img, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      splashColor: primcol,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              img,
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }
}
