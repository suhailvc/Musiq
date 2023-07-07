import 'package:flutter/material.dart';
import 'package:project_music_player/Screens/settings/sub_screens/PrivacyPolicy.dart';
import 'package:project_music_player/Screens/settings/sub_screens/Terms.dart';
import 'package:project_music_player/Screens/settings/sub_screens/about_Us.dart';
import 'package:project_music_player/widgets/Settings_Screen/Container.dart';
//import 'package:project_music_player/widgets/Settings_Screen/theme_container.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        toolbarHeight: mSize.height * 0.1,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 226, 222, 222)),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade800,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: mSize.height * 0.02),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  //stops: [0.5, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.5)
              ])),
          child: Column(
            children: [
              SizedBox(height: mSize.height * 0.15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUs(),
                      ));
                },
                child: settingsScreen(
                    index: 1,
                    ctx: context,
                    sName: 'About US',
                    sIcon: const Icon(Icons.info)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy(),
                      ));
                },
                child: settingsScreen(
                    index: 2,
                    ctx: context,
                    sName: 'Privacy Policy',
                    sIcon: const Icon(Icons.privacy_tip)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsandCondition(),
                      ));
                },
                child: settingsScreen(
                    index: 3,
                    ctx: context,
                    sName: 'Terms & Condition',
                    sIcon: const Icon(Icons.notes_rounded)),
              ),
            ],
          )),
    );
  }
}
