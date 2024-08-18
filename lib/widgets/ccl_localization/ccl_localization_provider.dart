part of 'ccl_localization.dart';

/// An inherited widget that provides the current locale to its descendants.
///
/// This widget allows you to access the locale from anywhere in the widget tree
/// below it using the `CCLLocalizationProvider.of(context)` method.
class _CCLLocalizationProvider extends InheritedWidget {
  /// Creates a new `CCLLocalizationProvider` widget.
  const _CCLLocalizationProvider({
    required this.locale,
    required super.child,
  });

  /// The current locale.
  final Locale locale;

  /// Returns the nearest `CCLLocalizationProvider` ancestor of the given context.
  static _CCLLocalizationProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_CCLLocalizationProvider>();
  }

  /// Returns true if the locale has changed.
  @override
  bool updateShouldNotify(_CCLLocalizationProvider old) {
    return locale != old.locale;
  }
}