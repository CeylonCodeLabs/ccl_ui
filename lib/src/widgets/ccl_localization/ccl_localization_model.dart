part of 'ccl_localization.dart';

/// A view model for the `CCLLocalization` widget.
///
/// This view model provides access to the `localeController` stream and the current `locale`
/// from the `LocalizationService`.
class _CCLLocalizationModel extends ReactiveViewModel {
  /// The localization service used to access locale information.
  final LocalizationService _localizationService =
      StackedLocator.instance.get();

  // final SecureSer

  final OnLocaleChanged? _onLocaleChanged;

  /// The fallback locale to use if no locale is saved in secure storage.
  final Locale? _fallbackLocale;

  /// The list of supported locales.
  final List<Locale>? _supportedLocales;

  _CCLLocalizationModel(
    this._onLocaleChanged,
    this._fallbackLocale,
    this._supportedLocales,
  ) {

    _localizationService.config(
      fallbackLocale: _fallbackLocale,
      supportedLocales: _supportedLocales,
    );
  }

  /// The current locale.
  Locale get locale => _localizationService.locale;

  Stream<Locale> get localeChanges => _localizationService.localeChanges;

  @override
  List<ListenableServiceMixin> get listenableServices => [_localizationService];

  void init() => addListener(() => _onLocaleChanged?.call(locale));
}
