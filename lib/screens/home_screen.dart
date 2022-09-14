import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/data/app_data.dart';
import 'package:tour_guide/data/const.dart';
import 'package:tour_guide/widgets/category_card.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 70),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 7 / 8),
      children: categories_data
          .map((e) => category_card(
                id: e.id,
                title: e.title,
                img: e.imageUrl,
              ))
          .toList(),
    );
  }
}
