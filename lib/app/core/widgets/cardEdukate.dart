import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class CardEdukate extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  const CardEdukate(
      {super.key,
      required this.image,
      required this.title,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.0.hp,
      width: 100.0.wp,
      padding: EdgeInsets.all(5),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 15.0.wp,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Image.asset(image))),
            SizedBox(
              width: 57.0.wp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(86, 86, 86, 1),
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w700),
                  ),
                  Text(date,
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w700,
                          color: Appcolors.greyPrimary))
                ],
              ),
            ),
            IconButton(
                onPressed: null,
                icon: Icon(Icons.bookmark_outline_sharp,
                    color: Appcolors.redPrimary))
          ],
        ),
      ),
    );
  }
}
