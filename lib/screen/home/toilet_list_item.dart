// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:public_toilets/models/toilet.dart';

class ToiletListItem extends StatelessWidget {
  final Toilet toilet;

  ToiletListItem({
    super.key,
    required this.toilet,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars =[];

    return Card(
      elevation: 6.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.home,
              size: 22.0,
            ),
            Expanded(
              child: Text(
                toilet.name.toString(),
                style: GoogleFonts.anticSlab(
                  fontSize: 25.0,
                  color: Colors.orange,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    //collection if, No if statement
                    if(toilet.point>2.5&&toilet.point<5)
                      Text('good'),
                    if(toilet.point==5.0)
                      Text('excellent'),
                    //collection for, No for statement
                    for(var i =0;i<toilet.point.floor();i++)
                      Icon(Icons.star),
                    Text(toilet.point.toString()),
                  ],
                ),
                Text(toilet.distance.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
