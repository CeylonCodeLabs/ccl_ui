part of '../common.dart';

/// Extension on TextStyle to provide convenience methods for setting text colors
/// based on theme colors
extension TextColorExtension on TextStyle? {

  /// Creates a new TextStyle with the given [color].
  TextStyle? wColor(Color color) => this?.copyWith(color: color);

  /// Creates a new TextStyle with the primary color from the current context.
  TextStyle? wcPrimary(BuildContext context) =>
      this?.copyWith(color: context.colors.primary);

  /// Creates a new TextStyle with the onPrimary color from the current context.
  TextStyle? wcOnPrimary(BuildContext context) =>
      this?.copyWith(color: context.colors.onPrimary);

  /// Creates a new TextStyle with the primaryContainer color from the current context.
  TextStyle? wcPrimaryContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.primaryContainer);

  /// Creates a new TextStyle with the onPrimaryContainer color from the current context.
  TextStyle? wcOnPrimaryContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.onPrimaryContainer);

  /// Creates a new TextStyle with the secondary color from the current context.
  TextStyle? wcSecondary(BuildContext context) =>
      this?.copyWith(color: context.colors.secondary);

  /// Creates a new TextStyle with the onSecondary color from the current context.
  TextStyle? wcOnSecondary(BuildContext context) =>
      this?.copyWith(color: context.colors.onSecondary);

  /// Creates a new TextStyle with the secondaryContainer color from the current context.
  TextStyle? wcSecondaryContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.secondaryContainer);

  /// Creates a new TextStyle with the onSecondaryContainer color from the current context.
  TextStyle? wcOnSecondaryContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.onSecondaryContainer);

  /// Creates a new TextStyle with the tertiary color from the current context.
  TextStyle? wcTertiary(BuildContext context) =>
      this?.copyWith(color: context.colors.tertiary);

  /// Creates a new TextStyle with the onTertiary color from the current context.
  TextStyle? wcOnTertiary(BuildContext context) =>
      this?.copyWith(color: context.colors.onTertiary);

  /// Creates a new TextStyle with the tertiaryContainer color from the current context.
  TextStyle? wcTertiaryContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.tertiaryContainer);

  /// Creates a new TextStyle with the onTertiaryContainer color from the current context.
  TextStyle? wcOnTertiaryContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.onTertiaryContainer);

  /// Creates a new TextStyle with the error color from the current context.
  TextStyle? wcError(BuildContext context) =>
      this?.copyWith(color: context.colors.error);

  /// Creates a new TextStyle with the onError color from the current context.
  TextStyle? wcOnError(BuildContext context) =>
      this?.copyWith(color: context.colors.onError);

  /// Creates a new TextStyle with the errorContainer color from the current context.
  TextStyle? wcErrorContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.errorContainer);

  /// Creates a new TextStyle with the onErrorContainer color from the current context.
  TextStyle? wcOnErrorContainer(BuildContext context) =>
      this?.copyWith(color: context.colors.onErrorContainer);

  /// Creates a new TextStyle with the background color from the current context.
  @Deprecated(
      'Use wcSurface instead. '
          'This feature was deprecated after v0.1.0'
  )
  TextStyle? wcBackground(BuildContext context) =>
       wcSurface(context);

  /// Creates a new TextStyle with the onBackground color from the current context.
  @Deprecated(
      'Use wcOnSurface instead. '
          'This feature was deprecated after v0.1.0'
  )
  TextStyle? wcOnBackground(BuildContext context) => wcOnSurface(context);

  /// Creates a new TextStyle with the surface color from the current context.
  TextStyle? wcSurface(BuildContext context) =>
      this?.copyWith(color: context.colors.surface);

  /// Creates a new TextStyle with the onSurface color from the current context.
  TextStyle? wcOnSurface(BuildContext context) =>
      this?.copyWith(color: context.colors.onSurface);

  /// Creates a new TextStyle with the surfaceVariant color from the current context.
  @Deprecated(
      'Use wcSurfaceContainerHighest instead. '
          'This feature was deprecated after v0.1.0'
  )
  TextStyle? wcSurfaceVariant(BuildContext context) =>
      wcSurfaceContainerHighest(context);

  /// Creates a new TextStyle with the surfaceVariant color from the current context.
  TextStyle? wcSurfaceContainerHighest(BuildContext context) =>
      this?.copyWith(color: context.colors.surfaceContainerHighest);

  /// Creates a new TextStyle with the onSurfaceVariant color from the current context.
  TextStyle? wcOnSurfaceVariant(BuildContext context) =>
      this?.copyWith(color: context.colors.onSurfaceVariant);

  /// Creates a new TextStyle with the outline color from the current context.
  TextStyle? wcOutline(BuildContext context) =>
      this?.copyWith(color: context.colors.outline);

  /// Creates a new TextStyle with the outlineVariant color from the current context.
  TextStyle? wcOutlineVariant(BuildContext context) =>
      this?.copyWith(color: context.colors.outlineVariant);

  /// Creates a new TextStyle with the shadow color from the current context.
  TextStyle? wcShadow(BuildContext context) =>
      this?.copyWith(color: context.colors.shadow);

  /// Creates a new TextStyle with the scrim color from the current context.
  TextStyle? wcScrim(BuildContext context) =>
      this?.copyWith(color: context.colors.scrim);

  /// Creates a new TextStyle with the inverseSurface color from the current context.
  TextStyle? wcInverseSurface(BuildContext context) =>
      this?.copyWith(color: context.colors.inverseSurface);

  /// Creates a new TextStyle with the onInverseSurface color from the current context.
  TextStyle? wcOnInverseSurface(BuildContext context) =>
      this?.copyWith(color: context.colors.onInverseSurface);

  /// Creates a new TextStyle with the inversePrimary color from the current context.
  TextStyle? wcInversePrimary(BuildContext context) =>
      this?.copyWith(color: context.colors.inversePrimary);

  /// Creates a new TextStyle with the surfaceTint color from the current context.
  TextStyle? wcSurfaceTint(BuildContext context) =>
      this?.copyWith(color: context.colors.surfaceTint);
}
