import 'package:flutter/material.dart';

class TermsandCondition extends StatelessWidget {
  const TermsandCondition({super.key});

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
          'Terms & Condition',
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
                '''Welcome to our music player app! By using our app, you agree to be bound by the following terms and conditions:

1.          Use of the App Our music player app is intended for personal, non-commercial use only. You may not use our app for any illegal or unauthorized purpose, or in a way that violates any applicable laws or regulations.

2.          User Content You are solely responsible for any content you upload, share, or otherwise make available through our app. By using our app, you grant us a non-exclusive, royalty-free license to use, copy, modify, and distribute your content as necessary for us to provide our services.

3.          Intellectual Property Our app and all related content, including but not limited to text, graphics, logos, and software, are the property of our company or our licensors and are protected by copyright.''',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
