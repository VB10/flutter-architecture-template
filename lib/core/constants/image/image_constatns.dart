class ImageConstants {
  static ImageConstants _instace;

  static ImageConstants get instance {
    if (_instace == null) _instace = ImageConstants._init();
    return _instace;
  }

  ImageConstants._init();

  String get logo => toPng("veli");

  String get hotDog => toPng("hotdogs");

  String toPng(String name) => "asset/image/$name.png";
}
