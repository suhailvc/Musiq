import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/play_list_bloc/play_list_bloc.dart';
import 'package:project_music_player/infrastructure/play_list/play_list_function.dart';
//import 'package:project_music_player/presentation/play_list/main_screen/play_list.dart';

// ignore: must_be_immutable
class PopUpPlayList extends StatelessWidget {
  int playListIndex;
  PopUpPlayList({required this.playListIndex, super.key});

  final renameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      color: const Color.fromARGB(255, 51, 50, 54),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              child: GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.deepPurple.shade200,
                    title: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: renameController,
                        validator: (_) {
                          if (renameController.text.trim().isEmpty ||
                              playListNotifier.any((playlist) =>
                                  playlist.name == renameController.text)) {
                            return 'Name is empty or already present';
                          }
                          return null;
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Enter new Play List name'),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pop(context);
                              context.read<PlayListBloc>().add(
                                  RenamePlayListBloc(
                                      playListIndex, renameController.text));
                              //playListRename(
                              //  playListIndex, renameController.text);
                              renameController.clear();

                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Enter'))
                    ],
                  );
                },
              );
            },
            child: const ListTile(
              title: Text(
                'Edit play list',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          )),
          PopupMenuItem(
              child: GestureDetector(
            onTap: () {
              // setState(() {
              //  deletePlayList(widget.playListIndex);
              context
                  .read<PlayListBloc>()
                  .add(DeletePlayListBloc(playListIndex));
              //  final message = SnackBar(content: Text('Deleted'));Scaffold.of(context).sh
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Deleted'),
                backgroundColor: Colors.deepPurple.shade800,
              ));
              // });

              Navigator.pop(context);
            },
            child: const ListTile(
              title: Text(
                'Delete play list',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.delete_outlined,
                color: Colors.white,
              ),
            ),
          ))
        ];
      },
    );
  }
}
