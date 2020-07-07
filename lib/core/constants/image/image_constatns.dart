class ImageConstants {
  static ImageConstants _instace;

  static ImageConstants get instance {
    if (_instace == null) _instace = ImageConstants._init();
    return _instace;
  }

  ImageConstants._init();

  String get logo => toPng("veli");

  String toPng(String name) => "assets/image/$name";
}
