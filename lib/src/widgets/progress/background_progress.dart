import 'dart:ui';

import 'package:ccl_core/ccl_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui.dart';

/// A widget that displays a progress indicator overlay when the provided ViewModel is busy.
///
/// This widget takes the following arguments:
///
/// * `child`: The widget to be displayed behind the progress indicator.
/// * `message`: An optional message to display below the progress indicator.
/// * `blurBackground`: Whether to blur the background while the progress indicator is shown. Defaults to `true`.
/// * `progressIndicator`: An optional custom progress indicator widget. If not provided, a default `CircularProgressIndicator` is used.
/// * `isChildVisibleWhileBusy`: Whether the `child` widget should remain visible while the progress indicator is shown. Defaults to `true`.
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
/// **Example:**
///
/// BackgroundProgress<YourViewModel>(
/// viewModelBuilder: () => YourViewModel(),
/// child: YourChildWidget(),
/// message: 'Loading data...',
/// blurBackground: true,
/// )
class BackgroundProgress<T extends BaseViewModel> extends ViewModelWidget<T> {
  /// The widget to be displayed behind the progress indicator.
  final Widget child;

  /// An optional message to display below the progress indicator.
  final String? message;

  final TextStyle? messageStyle;

  /// Whether to blur the background while the progress indicator is shown.
  final bool blurBackground;

  /// An optional progress indicator to display while the ViewModel is busy.
  final Widget? progressIndicator;

  /// Whether to show the child widget while the ViewModel is busy.
  final bool isChildVisibleWhileBusy;

  const BackgroundProgress(
      {super.key,
      required this.child,
      this.blurBackground = true,
      this.message,
      this.messageStyle,
      this.progressIndicator,
      this.isChildVisibleWhileBusy = true});

  @override
  Widget build(BuildContext context, T viewModel) {
    final progressIndicatorWidget =
        progressIndicator ?? const CircularProgressIndicator(strokeWidth: 3.0);

    final progressWidget = Container(
      decoration: BoxDecoration(
        color: context.colors.primaryContainer.withOpacity(0.5),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            progressIndicatorWidget,
            if (message.isNotNullAndNotEmpty) ...[
              verticalSpaceLight,
              Text(
                message!,
                style: messageStyle ??
                    context.styleTitleMedium?.copyWith(
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
          if (!viewModel.isBusy || isChildVisibleWhileBusy) child,
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
