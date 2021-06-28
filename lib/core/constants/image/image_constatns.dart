class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('veli');

  String get hotDog => toPng('hotdogs');
  String get projeIcon => toPng('cirlce_hwa');

  String toPng(String name) => 'asset/image/$name.png';
}
