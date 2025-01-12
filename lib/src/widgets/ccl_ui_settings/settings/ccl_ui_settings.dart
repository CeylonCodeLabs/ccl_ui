
part of '../ccl_ui_configurator.dart';

class CCLUiSettings {
  final BackgroundProgressSettings? backgroundProgressSettings;

  CCLUiSettings({this.backgroundProgressSettings});

  static CCLUiSettings defaultSettings(BuildContext context) {
    return CCLUiSettings(
      backgroundProgressSettings:
          BackgroundProgressSettings.defaultSettings(context),
    );
  }
}
