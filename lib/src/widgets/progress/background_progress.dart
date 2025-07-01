import 'dart:ui';

import 'package:ccl_core/ccl_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui.dart';

/// A widget that displays a progress indicator overlay when the provided ViewModel is busy.
///
/// This widget provides a convenient way to display a progress indicator while an asynchronous operation is in progress.
/// It overlays the progress indicator on top of the provided [child] widget.
///
/// The visibility of the progress indicator is controlled by the `isBusy`
/// state of the provided ViewModel. Optionally, a [busyObject] can be
/// provided to listen to a specific busy state within the ViewModel,
/// allowing for more granular control over when the progress indicator is shown.
///
/// **Configuration:**
///
/// The appearance and behavior of the progress indicator can be customized in two ways:
///
/// 1.  Using the `settings` parameter, which accepts a [BackgroundProgressSettings] object. This is the recommended approach for comprehensive configuration and consistent styling across your application.
/// 2.  Directly using the `message` and `messageStyle` properties for quick, localized customizations. If these properties are provided, they will override the corresponding settings from the `settings` object (if any).
///
/// **Backward Compatibility:**
///
/// For backward compatibility with existing code, the widget also provides direct properties like `blurBackground`, `progressIndicator`, and `isChildVisibleWhileBusy`.
/// However, these properties are now deprecated. If both the deprecated properties and the `settings` object are provided, the values from the `settings` object will take precedence.
///
/// **Examples:**
///
/// **Using `settings` (Recommended for consistent styling):**
///
/// ```dart
/// BackgroundProgress<YourViewModel>(
///   child: YourChildWidget(),
///   settings: BackgroundProgressSettings(
///     messageStyle: TextStyle(color: Colors.white, text: 'Loading...'),
///     blurBackground: true,
///     isChildVisibleWhileBusy: false,
///     progressIndicator: CircularProgressIndicator(),
///     backgroundColor: Colors.grey.withOpacity(0.5),
///   ),
/// )
/// ```
///
/// **Overriding message and style directly:**
///
/// ```dart
/// BackgroundProgress<YourViewModel>(
///   child: YourChildWidget(),
///   message: 'Custom Loading Message', // Overrides settings.messageStyle.text
///   messageStyle: TextStyle(color: Colors.red), // Overrides settings.messageStyle
///   blurBackground: true, // Uses the provided value, but deprecated
/// )
/// ```
class BackgroundProgress<T extends BaseViewModel> extends ViewModelWidget<T> {
  /// The widget to be displayed behind the progress indicator.
  final Widget child;

  /// An optional configuration object for background progress.
  /// This is the recommended way to customize the appearance and behavior for consistent styling.
  final BackgroundProgressSettings? settings;

  /// An optional message to display below the progress indicator.
  /// If provided, this will override `settings.messageStyle.text`.
  final String? message;

  /// An optional message style to display below the progress indicator.
  /// If provided, this will override `settings.messageStyle`.
  final TextStyle? messageStyle;

  /// An optional object to listen to for busy state.
  /// If provided, the progress indicator will only be shown when the ViewModel is busy with this specific object.
  /// If null, the progress indicator will be shown whenever the ViewModel's `isBusy` property is true.
  final Object? busyObject;

  /// **Deprecated:** Whether to blur the background while the progress indicator is shown.
  /// Use `settings.blurBackground` instead.
  @Deprecated('Use settings.blurBackground instead.')
  final bool? blurBackground;

  /// **Deprecated:** An optional progress indicator to display while the ViewModel is busy.
  /// Use `settings.progressIndicator` instead.
  @Deprecated('Use settings.progressIndicator instead.')
  final Widget? progressIndicator;

  /// **Deprecated:** Whether to show the child widget while the ViewModel is busy.
  /// Use `settings.isChildVisibleWhileBusy` instead.
  @Deprecated('Use settings.isChildVisibleWhileBusy instead.')
  final bool? isChildVisibleWhileBusy;

  const BackgroundProgress({
    super.key,
    required this.child,
    this.settings,
    this.message,
    this.messageStyle,
    this.blurBackground,
    this.progressIndicator,
    this.isChildVisibleWhileBusy,
    this.busyObject,
  });

  @override
  Widget build(BuildContext context, T viewModel) {
    final defaultSettings =
        CCLUiConfigurator.maybeOfBackgroundProgress(context) ??
            BackgroundProgressSettings.defaultSettings(context);

    final effectiveSettings = settings ??
        defaultSettings.copyWith(
          messageStyle: messageStyle,
          blurBackground: blurBackground,
          progressIndicator: progressIndicator,
          isChildVisibleWhileBusy: isChildVisibleWhileBusy,
        );

    final progressIndicatorWidget = progressIndicator ??
        effectiveSettings.progressIndicator ??
        const CircularProgressIndicator(strokeWidth: 3.0);

    final progressWidget = Container(
      decoration: BoxDecoration(
        color: effectiveSettings.backgroundColor,
        gradient: effectiveSettings.backgroundGradient,
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
                style: effectiveSettings.messageStyle,
              ),
            ],
          ],
        ),
      ),
    );

    final backgroundBlurFilter = effectiveSettings.backgroundBlurFilter ??
        ImageFilter.blur(sigmaX: 5, sigmaY: 5);

    final isBusy = busyObject == null ? viewModel.isBusy : viewModel.busy(busyObject);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      child: Stack(
        children: [
          if (!isBusy ||
              effectiveSettings.isChildVisibleWhileBusy) ...[
            child,
          ],
          if (isBusy) ...[
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: isBusy ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: effectiveSettings.blurBackground
                    ? BackdropFilter(
                        filter: backgroundBlurFilter,
                        child: progressWidget,
                      )
                    : progressWidget,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
