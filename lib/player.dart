import 'package:flutter/material.dart';

import 'package:music_player/playerpage.dart';

import 'music list.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  late List musics;
  late List musicList;
  //creates a list of musics
  @override
  void initState() {
    musicList = getList();
    musics = musicList;
    super.initState(); //parent init state
  }

  TextEditingController searchController = TextEditingController();
  search() {
    musics = musicList;
    List searchList = [];
    for (int i = 0; i < musics.length; i++) {
      if (musics[i]
          .title
          .toString()
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        setState(() {
          searchList.add(musics[i]);
        });
      }
    }
    setState(() {
      musics = searchList;
    });
  }

  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 35,
          actions: <Widget>[
            isSearch == false
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      },
                    ),
                  )
                : const SizedBox(),
          ],
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 39, 38, 38),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.music_note, size: 35),
          ),
          title: isSearch == false
              ? const Text(
                  "Music Player",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              : TextField(
                  onChanged: (value) {
                    search();
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search music',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearch = !isSearch;
                            musics = musicList;
                            searchController.clear();
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.white12),
                ),
        ),
        body: (ListView.builder(
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
                      const SizedBox(width: 25),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              musics[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              musics[index].singer,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
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
                )))));
  }
}
