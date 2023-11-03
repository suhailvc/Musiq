import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/play_list_bloc/play_list_bloc.dart';
import 'package:project_music_player/infrastructure/play_list/each_play_list.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';
//import 'package:project_music_player/Screens/Play%20List/Functions/Add.dart';
import 'package:project_music_player/presentation/play_list/functions/play_list_container.dart';
import 'package:project_music_player/presentation/play_list/sub_screen/play_list_songs.dart';
import 'package:project_music_player/presentation/mini_player/mini_player.dart';

class PlayList extends StatelessWidget {
  PlayList({super.key});

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
                                playListNotifier.any((playlist) =>
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
                                // createPlayList(playListNameController.text);
                                context.read<PlayListBloc>().add(
                                    CreatePlayListBloc(
                                        playListNameController.text));
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
        child: BlocBuilder<PlayListBloc, PlayListState>(
          builder: (context, state) {
            return ListView(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 15),
                  itemCount: state.playListNotifierBloc.length,
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
                                  title:
                                      state.playListNotifierBloc[index].name),
                            ));
                      },
                      child: PlayListContainer(context,
                          state.playListNotifierBloc[index].name, index),
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
