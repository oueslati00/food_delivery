import 'dart:html';

import 'package:app_food_delivery/models/product.dart';
import 'package:app_food_delivery/pages/ExpansionList.dart';
import 'package:flutter/material.dart';
import 'package:app_food_delivery/core/consts.dart';
import 'package:app_food_delivery/pages/detail_page.dart';
import 'package:app_food_delivery/models/ImageToTest.dart';

class PanierPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ExpansionList();
  }
}
/*
* CustomScrollView(slivers: <Widget>[
      const SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        backgroundColor: Colors.green,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Panier'),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Image(
                    width: 70,
                    image: AssetImage("assets/${foodList[index].imgPath}"),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${food[index].name}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          Text(
                            "\$${food[index].price}",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.redColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "( gm Weight)",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          childCount: food.length,
        ),
      ),
    ]
    );*/