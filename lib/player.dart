import 'package:flutter/material.dart';
import 'package:music_player/musics.dart';
import 'package:music_player/playerpage.dart';

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

  List getList() {
    // a function called as getList() of List type
    return [
      Musics(
          title: "Uptown Funk",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows8_5ea7d4f04e41e.jpeg",
          singer: "One Republic",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
      Musics(
        title: "Black Space",
        image:
            "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows10_5ea7d51d28f24.jpeg",
        singer: "Sia",
        audio: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
      ),
      Musics(
        title: "Shake it off",
        image:
            "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows2_5ea7d47403432.jpeg",
        singer: "Coldplay",
        audio: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
      ),
      Musics(
          title: "Lean On",
          image:
              "https://i.pinimg.com/originals/ea/60/26/ea60268f4374e8840c4529ee1462fa38.jpg",
          singer: "T. Schürger",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3"),
      Musics(
          title: "Sugar",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg",
          singer: "Adele",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3"),
      Musics(
          title: "Believer",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg",
          singer: "Ed Sheeran",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3"),
      Musics(
          title: "Stressed out",
          image:
              "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg",
          singer: "Mark Ronson",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3"),
      Musics(
          title: "Girls Like You",
          image:
              "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg",
          singer: "Maroon 5",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3"),
      Musics(
          title: "Let her go",
          image:
              "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg",
          singer: "Passenger",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3"),
      Musics(
          title: "Roar",
          image:
              "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp",
          singer: "Katy Perry",
          audio:
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3"),
    ];
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
        backgroundColor: const Color.fromARGB(255, 39, 38, 38),
        leading: const Icon(Icons.music_note, size: 45),
        title: const Text(
          "Music Player",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                                      music: musics[index],
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
