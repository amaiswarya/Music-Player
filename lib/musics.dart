class Musics {
  late String
      title; //late keyword is to assure that a value will be passed in future
  late String image;
  late String singer;
  late String audio;
  Musics(
      {required this.title,
      required this.image,
      required this.singer,
      required this.audio}); //required keyword is to ensure thet null value is not passed into this
}
