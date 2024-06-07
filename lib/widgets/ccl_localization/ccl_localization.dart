part of '../widgets.dart';

/// A widget that provides localization for its child widget.
///
/// This widget listens to the `localeController` stream in the `CCLLocalizationModel`
/// and rebuilds its child widget with the updated locale using `CCLLocalizationProvider`.
class CCLLocalization extends StackedView<CCLLocalizationModel> {
  /// The child widget to localize.
  final Widget child;
  final bool showLoading;

  /// Creates a new `CCLLocalization` widget.
  const CCLLocalization(
      {super.key, required this.child, this.showLoading = false});

  @override
  Widget builder(
    BuildContext context,
    CCLLocalizationModel viewModel,
    Widget? child,
  ) {
    return CCLLocalizationProvider(
      locale: viewModel.locale,
      child: this.child,
    );
  }

  @override
  CCLLocalizationModel viewModelBuilder(BuildContext context) =>
      CCLLocalizationModel();

  @override
  void onViewModelReady(CCLLocalizationModel viewModel) => viewModel.init();

  @override
  bool get fireOnViewModelReadyOnce => true;
}
