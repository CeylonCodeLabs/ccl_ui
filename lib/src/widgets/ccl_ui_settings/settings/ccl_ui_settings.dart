part of '../ccl_ui_configurator.dart';

/// Represents the UI settings for the CCL (Common Components Library).
///
/// This class holds various settings that control the appearance and behavior
/// of UI components within the CCL. It includes settings for general UI
/// elements and background progress indicators.
class CCLUiSettings {
  /// General settings for UI components.
  ///
  /// These settings might include things like theme colors, typography,
  /// spacing, etc.
  final GeneralSettings? generalSettings;

  /// Settings for background progress indicators.
  ///
  /// These settings might control the appearance and behavior of progress
  /// indicators that are displayed in the background.
  final BackgroundProgressSettings? backgroundProgressSettings;

  /// Creates a new instance of [CCLUiSettings].
  ///
  /// [generalSettings] and [backgroundProgressSettings] are optional. If not
  /// provided, the default settings will be used when accessing them through
  /// the [defaultSettings] factory constructor.
  CCLUiSettings({this.generalSettings, this.backgroundProgressSettings});

  /// Provides default UI settings for the CCL.
  ///
  /// This factory constructor creates a [CCLUiSettings] instance with default
  /// settings for both [generalSettings] and [backgroundProgressSettings].
  /// The default settings are determined by the respective `defaultSettings`
  /// factory constructors of [GeneralSettings] and [BackgroundProgressSettings].
  ///
  /// The [context] is required to provide context-dependent default settings,
  /// such as theme data.
  static CCLUiSettings defaultSettings(BuildContext context) {
    return CCLUiSettings(
      generalSettings: GeneralSettings.defaultSettings(context),
      backgroundProgressSettings:
      BackgroundProgressSettings.defaultSettings(context),
    );
  }
}
