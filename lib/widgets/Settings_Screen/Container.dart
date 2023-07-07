import 'package:flutter/material.dart';

Widget settingsScreen(
    {required BuildContext ctx,
    required String sName,
    required Icon sIcon,
    required index}) {
  var mSize = MediaQuery.of(ctx).size;
  return Padding(
    padding: const EdgeInsets.only(top: 9),
    child: Container(
      width: mSize.height * 0.45,
      height: mSize.height * 0.08,
      decoration: BoxDecoration(
          color: Colors.deepPurple.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        leading: sIcon,
        title: Padding(
          padding: EdgeInsets.only(left: mSize.height * 0.06),
          child: Text(
            sName,
            style: TextStyle(fontSize: mSize.height * .029),
          ),
        ),
      ),
    ),
  );
}
