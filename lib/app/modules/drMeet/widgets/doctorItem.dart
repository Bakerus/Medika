import 'package:flutter/material.dart';

class Doctoritem extends StatelessWidget {
  const Doctoritem(
      {super.key,
      required this.name,
      required this.speciality,
      required this.experience,
      required this.location});

  final String name;
  final String speciality;
  final String experience;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: ListTile(
        leading: SizedBox(
          width: 100,
          child: Image.asset(
            "assets/images/icons/logo.png",
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(speciality),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                Text(experience),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.pin_drop),
                Text(location),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
