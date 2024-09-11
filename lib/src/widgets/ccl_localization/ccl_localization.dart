
import 'package:ccl_services/ccl_services.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

part 'ccl_localization_model.dart';

part 'ccl_localization_provider.dart';

typedef OnLocaleChanged = Future<void> Function(Locale locale);

/// A widget that provides localization for its child widget.
///
/// This widget listens to the `localeController` stream in the `CCLLocalizationModel`
/// and rebuilds its child widget with the updated locale using `CCLLocalizationProvider`.
class CCLLocalization extends StackedView<_CCLLocalizationModel> {
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
    _CCLLocalizationModel viewModel,
    Widget? child,
  ) {
    return _CCLLocalizationProvider(
      locale: viewModel.locale,
      child: Builder(builder: childBuilder),
    );
  }

  @override
  _CCLLocalizationModel viewModelBuilder(BuildContext context) =>
      _CCLLocalizationModel(onLocaleChanged, fallbackLocale, supportedLocales);

  @override
  void onViewModelReady(_CCLLocalizationModel viewModel) => viewModel.init();

  @override
  bool get fireOnViewModelReadyOnce => true;

  // ignore: library_private_types_in_public_api
  static _CCLLocalizationProvider of(BuildContext context) =>
      _CCLLocalizationProvider.of(context)!;
}
