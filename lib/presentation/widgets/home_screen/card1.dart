import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  String image;
  String text;
  CardList({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    return SizedBox(
      width: mSize.width * 0.48,
      height: 370,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20), // Set the desired border radius
        ),
        color: Colors.white.withOpacity(0.6),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
