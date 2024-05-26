import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class OthersModules extends StatelessWidget {
  final String image;
  final String desription;
  final Color backgroundColor;
  final Color bouttonColor;
  final Color colorText;
  final String textbutton;
  const OthersModules(
      {super.key,
      required this.desription,
      required this.image,
      required this.backgroundColor,
      required this.colorText,
      required this.bouttonColor,
      required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8.0)),
      height: 18.0.hp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    desription,
                    style: TextStyle(
                        color: colorText,
                        fontFamily: 'Outfit',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
                width: 40.0.wp,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            bouttonColor),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 2),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        )),
                    onPressed: null,
                    child: Text(textbutton)),
              )
            ],
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 22.0.wp,
          )
        ],
      ),
    );
  }
}
