import 'package:flutter/material.dart';
import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
import 'package:project_music_player/Model/Model.dart';
//import 'package:project_music_player/Screens/home_screen/HomeScreen1.dart';
import 'package:project_music_player/Screens/Play%20List/MainScreen/PlayList.dart';
//import 'package:project_music_player/widgets/BottomBar.dart';
//import 'package:project_music_player/Screens/SplashScreen.dart';
//import 'package:project_music_player/widgets/playList/PopUpPlayList.dart';

// ignore: must_be_immutable
class AllSongsaPLAdding extends StatefulWidget {
  SongDetails song;
  AllSongsaPLAdding({required this.song, super.key});

  @override
  State<AllSongsaPLAdding> createState() => _AllSongsaPLAddingState();
}

class _AllSongsaPLAddingState extends State<AllSongsaPLAdding> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 8, 2, 31),
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios)),
          toolbarHeight: size.height * 0.1,
          title: const Text(
            'Add to PlayList',
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
          padding: EdgeInsets.only(
              left: size.height * 0.02, right: size.height * 0.02),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  // stops: [0.5, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.5)
              ])),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.17),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: nameController,
                  validator: (_) {
                    if (nameController.text.trim().isEmpty ||
                        PlayListNotifier.value.any((playlist) =>
                            playlist.name == nameController.text)) {
                      return 'Name is empty or alredy present';
                    }
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      filled: true,
                      fillColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Enter Play List name'),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                  width: size.height * 0.27,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState!.validate()) {
                            createPlayList(nameController.text);
                            nameController.clear();
                            // Navigator.pop(context);
                          }
                        });
                      },
                      child: const Text('Create New Play List'))),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 25),
                  itemCount: PlayListNotifier.value.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          if (PlayListNotifier.value[index].container
                              .where(
                                  (element) => element.name == widget.song.name)
                              .isEmpty) {
                            PlayListNotifier.value[index].container
                                .insert(0, widget.song);
                            addSongToPlayList(widget.song,
                                PlayListNotifier.value[index].name);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Song Added'),
                              backgroundColor: Colors.deepPurple.shade800,
                              duration: const Duration(seconds: 1),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Song Alredy Present'),
                              backgroundColor: Colors.deepPurple.shade800,
                            ));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/PlayList 1.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: Color.fromARGB(131, 255, 255, 255)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: size.height * 0.019),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.height * 0.01),
                                      child: Text(
                                        PlayListNotifier.value[index].name,
                                        style: TextStyle(
                                            fontSize: size.height * 0.025,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
