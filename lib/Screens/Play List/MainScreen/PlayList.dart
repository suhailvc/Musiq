import 'package:flutter/material.dart';
import 'package:project_music_player/DataBase/Functions/EachPlayList.dart';
import 'package:project_music_player/DataBase/Functions/PlayListFunction.dart';
//import 'package:project_music_player/Screens/Play%20List/Functions/Add.dart';
import 'package:project_music_player/Screens/Play%20List/Functions/PlayListContainer.dart';
import 'package:project_music_player/Screens/Play%20List/SubScreen/PlayListSongs.dart';
import 'package:project_music_player/Screens/mini_player/MiniPlayer.dart';

ValueNotifier<List<EachPlayList>> PlayListNotifier = ValueNotifier([]);

class PlayList extends StatefulWidget {
  const PlayList({super.key});

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  var playListNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 8, 2, 31),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        toolbarHeight: size.height * 0.1,
        title: const Text(
          'Play List',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 226, 222, 222)),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.height * 0.018),
            child: GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.deepPurple.shade200,
                      title: Form(
                        key: formKey,
                        child: TextFormField(
                          controller: playListNameController,
                          // ignore: body_might_complete_normally_nullable
                          validator: (_) {
                            if (playListNameController.text.trim().isEmpty ||
                                PlayListNotifier.value.any((playlist) =>
                                    playlist.name ==
                                    playListNameController.text)) {
                              return 'Name is empty or alredy present';
                            }
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              filled: true,
                              fillColor: Colors.deepPurple.shade100,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'Enter Play List name'),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                createPlayList(playListNameController.text);
                                playListNameController.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Enter'))
                      ],
                    );
                  },
                );
              },
              child: Icon(
                Icons.add,
                size: size.height * 0.038,
              ),
            ),
          )
        ],
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
                // stops: [0.5, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8)
            ])),
        child: ValueListenableBuilder(
          valueListenable: PlayListNotifier,
          builder: (context, value, child) {
            return ListView(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 15),
                  itemCount: PlayListNotifier.value.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayListSongs(
                                  idx: index,
                                  title: PlayListNotifier.value[index].name),
                            ));
                      },
                      child: PlayListContainer(
                          context, PlayListNotifier.value[index].name, index),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: const MiniPlayer(),
    );
  }
}
