import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class CardPharmax extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  const CardPharmax(
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
        surfaceTintColor: Colors.white,
        child: SizedBox(
          width: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: Appcolors.greyPrimary)),
                    ],
                  ),
                  SizedBox(
                    height: 28.0,
                    width: 20.0.wp,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Appcolors.redOpacity),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Appcolors.redPrimary),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(vertical: 2),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            )),
                        onPressed: null,
                        child: Text('pharmacies',
                            style: TextStyle(
                              color: Appcolors.redPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Outfit',
                            ))),
                  )
                ],
              ),
              Text("1500 FCFA",
                  style: TextStyle(
                    color: Appcolors.blackPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Outfit',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
