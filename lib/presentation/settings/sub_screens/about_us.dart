import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 8, 2, 31),
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        toolbarHeight: mSize.height * 0.1,
        title: const Text(
          'About Us',
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
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '''Welcome to our music player app! We are a team of passionate developers who love music and technology. Our goal is to create a user-friendly and intuitive music player that allows you to easily listen to your favourite songs and discover new ones.
      
With our app, you can create playlists, shuffle songs, and control the playback with simple gestures. We also offer a wide range of customization options, so you can personalize your listening experience to suit your preferences.
       
Our app supports a variety of audio formats, including MP3, FLAC, and WAV, and allows you to play music from your local storage or streaming services. We are committed to constantly improving and updating our app to ensure the best possible experience for our users.
            
Thank you for choosing our music player app, and we hope you enjoy using it as much as we enjoyed creating it!''',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
