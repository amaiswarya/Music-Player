import 'package:flutter/material.dart';

import 'package:music_player/playerpage.dart';

import 'music list.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  late List musics; //creates a list of musics
  @override
  void initState() {
    musics = getList();
    super.initState(); //parent init state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 39, 38, 38),
        leading: const Icon(Icons.music_note, size: 35),
        title: const Text(
          "Music Player",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 15, 15, 15),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: musics.length,
                  itemBuilder: (context, index) => InkWell(
                      //inkwell widget gives the tap event
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Player(
                                      music: musics,
                                      index: index,
                                    )));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 80.0,
                              width: 80.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    musics[index].image,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(width: 20),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    musics[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    musics[index].singer,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  )
                                ]),
                            const Spacer(),
                            const Icon(
                              Icons.play_circle_fill,
                              color: Colors.red,
                              size: 45,
                            )
                          ],
                        ),
                      ))))
        ],
      ),
    );
  }
}
