import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths _instace;
  static SVGImagePaths get instance {
    if (_instace == null) _instace = SVGImagePaths._init();
    return _instace;
  }

  SVGImagePaths._init();

  final relaxSVG = "relax".toSVG;
  final astronautSVG = "astronaut".toSVG;
  final chattingSVG = "chat".toSVG;
}
