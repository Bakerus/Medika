import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class DialogMap extends StatelessWidget {
  const DialogMap({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: 
        Positioned(
          bottom: 5.0.hp,
          child: Container(
              height: 30.0.hp,
              width: 70.0.wp,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text(
                                  "Centre ville - Sangmelima",
                                  style: TextStyle(
                                      fontSize: 11.87,
                                      color: Color.fromRGBO(137, 136, 141, 1),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Pharmacie Rosa Parks",
                      style: TextStyle(
                          color: Color.fromRGBO(16, 22, 35, 1),
                          fontSize: 19.6,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 30.0.wp,
                              height: 6.0.hp,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Appcolors.redOpacity),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Appcolors.redPrimary),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(45.0),
                                        ),
                                      )),
                                  onPressed: null,
                                  child: Text("conctacts",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Appcolors.redPrimary,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w700))),
                            ),
                            Text(
                              "+237 656704510",
                              style: TextStyle(
                                  fontSize: 13.57,
                                  color: Appcolors.greySmallText,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 30.0.wp,
                          height: 6.0.hp,
                          child: ElevatedButton(
                              onPressed: null,
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Appcolors.greenOpacity),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Appcolors.greenPrimary),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45.0),
                                    ),
                                  )),
                              child: Text("De garde",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Appcolors.greenPrimary,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w600))),
                        ),
                      ],
                    ),
                  ])),
        ),
    );
  }
}