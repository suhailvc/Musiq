import 'package:flutter/material.dart';
import 'package:project_music_player/presentation/settings/main_Screen/settings_screen.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple.shade800.withOpacity(0.8),
      elevation: 0,
      title: const Text('MUSIQ'),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 28),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ));
                },
                child: const Icon(Icons.settings)),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
