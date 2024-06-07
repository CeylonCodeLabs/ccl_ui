part of 'widgets.dart';

/// A widget that animates the appearance of text.
///
/// This widget takes the following arguments:
///
/// * `text`: The text to be displayed.
/// * `style`: The style of the text (optional).
/// * `bounce`: Whether to animate the text with a bounce effect (default: false).
/// * `direction`: The direction in which to animate the text (default: Axis.vertical).
/// * `textAlign`: The alignment of the text (default: Alignment.centerLeft).
///
/// The widget uses an `AnimatedSwitcher` to transition between old and new text.
/// The transition builder takes an animation and a child widget as arguments.
///
/// If `bounce` is true, the text will be animated with a slide and fade transition.
/// The slide transition will move the text from its initial position to its final position.
/// The fade transition will fade the text in from 0.0 opacity to 1.0 opacity.
///
/// If `bounce` is false, the text will be animated with a fade transition only.
///
/// The `direction` argument determines the direction in which the text will be animated.
/// The valid values are `Axis.vertical` and `Axis.horizontal`.
///
/// The `textAlign` argument determines the alignment of the text.
/// The valid values are any of the alignment constants from the `Alignment` class.
///
/// This widget is useful for displaying animated text effects, such as typing animations or text reveals.
///
/// See also:
///
/// * `AnimatedSwitcher`: The widget used to transition between old and new text.
/// * `SlideTransition`: The transition used to animate the text with a slide effect.
/// * `FadeTransition`: The transition used to animate the text with a fade effect.
/// * `Alignment`: The class used to define the alignment of the text.
class AnimatedText extends StatelessWidget {
  /// The text to be displayed.
  final String text;

  /// The style of the text (optional).
  final TextStyle? style;

  /// Whether to animate the text with a bounce effect (default: false).
  final bool bounce;

  /// The direction in which to animate the text (default: Axis.vertical).
  final Axis direction;

  /// The alignment of the text (default: Alignment.centerLeft).
  final Alignment textAlign;

  /// Creates a new instance of the AnimatedText widget.
  const AnimatedText(
    this.text, {
    super.key,
    this.style,
    this.bounce = false,
    this.direction = Axis.vertical,
    this.textAlign = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    var x = direction == Axis.horizontal ? 0.5 : 0.0;
    var y = direction == Axis.vertical ? 0.5 : 0.0;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        if (bounce) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(bounce ? x : 0.0, bounce ? y : 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation),
            child: FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            ),
          );
        } else {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
            child: child,
          );
        }
      },
      child: Text(
        text,
        key: ValueKey<String>(text),
        style: style,
      ),
    );
  }
}
