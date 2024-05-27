import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';

class PharmaX_viewDetails extends StatelessWidget {
  const PharmaX_viewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Appcolors.blackText)),
        title: const Text('Details'),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: Appcolors.blackText,
              ))
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/Soue.jpg",
            height: 35.0.hp,
            width: 100.0.wp,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 50.0.hp,
            margin: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("OBH Combi",
                        style: TextStyle(
                          color: Appcolors.blackPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Outfit',
                        )),
                        Text("75ml",style: TextStyle(
                              color: Appcolors.greySmallText,
                              fontFamily: 'Outfit',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),),
                  ],
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 6.5.hp,
                      width: 30.0.wp,
                      child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Appcolors.redPrimary),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(vertical: 5),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              )),
                          child: Text("Pharmacies")),
                    ),
                    Text("1500 FCFA",
                        style: TextStyle(
                          color: Appcolors.blackPrimary,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Outfit',
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Appcolors.blackPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Outfit',
                      ),
                    ),
                    SizedBox(
                        width: 90.0.hp,
                        child: Text(
                          "OBH COMBI est un médicament contre la toux contenant du Paracetamol, de l’éphédrine HCl et du maléate de chlorphénamine qui est utilisé pour soulager la toux accompagnée de symptômes de grippe tels que la fièvre, les maux de tête et les éternuements.",
                          style: TextStyle(
                              color: Appcolors.greySmallText,
                              fontFamily: 'Outfit',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 6.5.hp,
                      width: 90.0.wp,
                      child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Appcolors.redOpacity),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Appcolors.redPrimary),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(vertical: 5),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              )),
                          child: Text(
                            "Retour",
                            style: TextStyle(
                              color: Appcolors.redPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Outfit',
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
