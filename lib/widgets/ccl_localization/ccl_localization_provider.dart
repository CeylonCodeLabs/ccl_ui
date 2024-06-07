part of '../widgets.dart';

/// An inherited widget that provides the current locale to its descendants.
///
/// This widget allows you to access the locale from anywhere in the widget tree
/// below it using the `CCLLocalizationProvider.of(context)` method.
class CCLLocalizationProvider extends InheritedWidget {
  /// Creates a new `CCLLocalizationProvider` widget.
  const CCLLocalizationProvider({
    super.key,
    required this.locale,
    required super.child,
  });

  /// The current locale.
  final Locale locale;

  /// Returns the nearest `CCLLocalizationProvider` ancestor of the given context.
  static CCLLocalizationProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CCLLocalizationProvider>()
    as CCLLocalizationProvider;
  }

  /// Returns true if the locale has changed.
  @override
  bool updateShouldNotify(CCLLocalizationProvider old) {
    return locale != old.locale;
  }
}