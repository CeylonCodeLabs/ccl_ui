part of '../widgets.dart';

/// A widget that provides localization for its child widget.
///
/// This widget listens to the `localeController` stream in the `CCLLocalizationModel`
/// and rebuilds its child widget with the updated locale using `CCLLocalizationProvider`.
class CCLLocalization extends StackedView<CCLLocalizationModel> {
  /// The child widget to localize.
  final WidgetBuilder childBuilder;

  /// The fallback locale to use if no locale is saved in secure storage.
  final Locale? fallbackLocale;

  /// The list of supported locales.
  final List<Locale>? supportedLocales;

  final OnLocaleChanged? onLocaleChanged;

  /// Creates a new `CCLLocalization` widget.
  const CCLLocalization(
      {super.key,
      required this.childBuilder,
      this.onLocaleChanged,
      this.fallbackLocale,
      this.supportedLocales});

  @override
  Widget builder(
    BuildContext context,
    CCLLocalizationModel viewModel,
    Widget? child,
  ) {
    return _CCLLocalizationProvider(
      locale: viewModel.locale,
      child: Builder(builder: childBuilder),
    );
  }

  @override
  CCLLocalizationModel viewModelBuilder(BuildContext context) =>
      CCLLocalizationModel(onLocaleChanged, fallbackLocale, supportedLocales);

  @override
  void onViewModelReady(CCLLocalizationModel viewModel) => viewModel.init();

  @override
  bool get fireOnViewModelReadyOnce => true;

  // ignore: library_private_types_in_public_api
  static _CCLLocalizationProvider of(BuildContext context) =>
      _CCLLocalizationProvider.of(context)!;
}
