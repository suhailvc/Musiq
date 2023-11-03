import 'package:flutter/material.dart';

class ThemeContainer extends StatefulWidget {
  const ThemeContainer({super.key});

  @override
  State<ThemeContainer> createState() => _ThemeContainerState();
}

class _ThemeContainerState extends State<ThemeContainer> {
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(top: 9),
        child: Container(
          width: mSize.height * 0.45,
          height: mSize.height * 0.08,
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade800,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: ListTile(
            leading: const Icon(Icons.brush),
            title: Padding(
              padding: EdgeInsets.only(left: mSize.height * 0.06),
              child: Text(
                'Theme',
                style: TextStyle(fontSize: mSize.height * .029),
              ),
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ));
  }
}
