part of '../widgets.dart';

/// A view model for the `CCLLocalization` widget.
///
/// This view model provides access to the `localeController` stream and the current `locale`
/// from the `LocalizationService`.
class CCLLocalizationModel extends ReactiveViewModel {
  /// The localization service used to access locale information.
  final LocalizationService _localizationService = StackedLocator.instance.get();

  /// The current locale.
  Locale get locale => _localizationService.locale;

  @override
  List<ListenableServiceMixin> get listenableServices => [_localizationService];

  void init() => addListener(() => rebuildUi());
}