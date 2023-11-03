//import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_music_player/application/bloc/find_song_bloc_bloc.dart';

class FindSong extends StatelessWidget {
  FindSong({super.key});

  ACRCloudResponseMusicItem? music;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FindSongBlocBloc>(context).add(GetSongEvent(null));
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 8, 2, 31),
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        title: const Text(
          'Find Song',
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
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8)
            ])),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.26,
            ),
            const Text(
              'Tap Here',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            GestureDetector(
              onTap: () async {
                context.read<FindSongBlocBloc>().add(GetSongEvent(null));
                //setState(() {
                music = null;
                // });

                final session = ACRCloud.startSession();

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.deepPurple.shade200,
                    title: const Text(
                      'Listening...',
                      // style: TextStyle(color: Colors.amber),
                    ),
                    content: const Text('please play the song'),
                    actions: [
                      TextButton(
                        onPressed: session.cancel,
                        child: const Text('Cancel'),
                      )
                    ],
                  ),
                );

                final result = await session.result;
                // ignore: use_build_context_synchronously
                Navigator.pop(context);

                if (result == null) {
                  // Cancelled.
                  return;
                } else if (result.metadata == null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No result.'),
                  ));
                  return;
                }

                //// setState(() {
                music = result.metadata!.music.first;
                // });
                // log(music?.title ?? 'unknown');
              },
              child: AvatarGlow(
                showTwoGlows: true,
                glowColor: Colors.blue,
                endRadius: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: size.height * 0.1,
                  child: Icon(
                    Icons.bolt,
                    size: size.height * 0.2,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              music?.title ?? '',
              style: const TextStyle(fontSize: 23),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              music?.artists.toString() ?? '',
              style: const TextStyle(fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
