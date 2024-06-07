part of '../widgets.dart';

/// A widget that displays a progress indicator overlay when the provided ViewModel is busy.
///
/// This widget takes the following arguments:
///
/// * `child`: The widget to be displayed behind the progress indicator.
/// * `message`: An optional message to display below the progress indicator.
/// * `blurBackground`: Whether to blur the background while the progress indicator is shown.
///
/// The widget uses a stack to position the progress indicator on top of the child widget.
/// When the ViewModel is busy, the progress indicator is animated with an opacity of 1.0.
/// Otherwise, the progress indicator is animated to an opacity of 0.0.
///
/// The progress indicator itself is a `CircularProgressIndicator` with a stroke width of 3.0.
/// If a message is provided, it is displayed below the progress indicator with appropriate styling
/// and shadows.
///
/// If `blurBackground` is true, the background will be blurred using an `ImageFilter` with a sigma of 5.0.
///
/// This widget is useful for displaying a progress indicator while data is being loaded or an operation is in progress.
///
/// See also:
///
/// * `CircularProgressIndicator`: The progress indicator used by this widget.
/// * `ImageFilter`: The filter used to blur the background when `blurBackground` is true.
class BackgroundProgress<T extends BaseViewModel> extends ViewModelWidget<T> {
  /// The widget to be displayed behind the progress indicator.
  final Widget child;

  /// An optional message to display below the progress indicator.
  final String? message;

  /// Whether to blur the background while the progress indicator is shown.
  final bool blurBackground;

  const BackgroundProgress(
      {super.key,
      required this.child,
      this.blurBackground = true,
      this.message});

  @override
  Widget build(BuildContext context, T viewModel) {
    final progressWidget = Container(
      decoration: BoxDecoration(
          color: context.colors.primaryContainer.withOpacity(0.5)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(strokeWidth: 3.0),
            if (message.isNotNullOrEmpty) ...[
              verticalSpaceLight,
              Text(
                message!,
                style: context.styleTitleMedium?.copyWith(
                  color: context.colors.onPrimaryContainer,
                  shadows: [
                    BoxShadow(
                      color: context.colors.primaryContainer,
                      spreadRadius: 5.0,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      child: Stack(
        children: [
          child,
          if (viewModel.isBusy)
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: viewModel.isBusy ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: blurBackground
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: progressWidget,
                      )
                    : progressWidget,
              ),
            ),
        ],
      ),
    );
  }
}
