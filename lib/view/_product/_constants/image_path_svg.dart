import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

class SVGImagePaths {

  SVGImagePaths._init();
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  final relaxSVG = 'relax'.toSVG;
  final astronautSVG = 'astronaut'.toSVG;
  final chattingSVG = 'chat'.toSVG;
}
