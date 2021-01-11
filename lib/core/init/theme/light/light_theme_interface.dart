import 'color_scheme_light.dart';
import 'padding_insets.dart';
import 'text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets insets = PaddingInsets();
}
