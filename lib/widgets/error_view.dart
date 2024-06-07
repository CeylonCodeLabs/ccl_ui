part of 'widgets.dart';

/// A widget that displays an error message with an optional title and button.
///
/// This widget takes the following arguments:
///
/// * `title`: The title of the error message (optional).
/// * `titleStyle`: The style of the title text (optional).
/// * `message`: The main message of the error.
/// * `messageStyle`: The style of the message text (optional).
/// * `buttonText`: The text displayed on the button (default: 'Go Back').
/// * `onTap`: The function to be called when the button is tapped (optional).
///
/// The widget displays the title and message in a centered column.
/// If a title is provided, it is displayed above the message with appropriate styling.
/// The message is displayed with appropriate styling as well.
///
/// If an `onTap` function is provided, a button is displayed below the message.
/// The button text is set to `buttonText` by default, but this can be customized.
/// When the button is tapped, the `onTap` function is called.
///
/// This widget is useful for displaying error messages to users in your application.
/// It provides a simple and clear way to communicate the nature of the error and offer
/// users a way to recover or navigate away from the error state.
///
/// See also:
///
/// * `ElevatedButton`: The widget used to display the button.
/// * `Text`: The widget used to display the title and message text.
/// * `Center`: The widget used to center the error message in the screen.
class ErrorView extends StatelessWidget {
  /// The title of the error message (optional).
  final String? title;

  /// The style of the title text (optional).
  final TextStyle? titleStyle;

  /// The main message of the error.
  final String message;

  /// The style of the message text (optional).
  final TextStyle? messageStyle;

  /// The text displayed on the button (default: 'Go Back').
  final String buttonText;

  /// The function to be called when the button is tapped (optional).
  final VoidCallback? onTap;

  const ErrorView({
    super.key,
    this.title,
    this.titleStyle,
    required this.message,
    this.messageStyle,
    this.buttonText = 'Go Back',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (title.isNotNullOrEmpty)
            Padding(
              padding: const EdgeInsets.all(sizeDefault),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: titleStyle ?? context.styleTitleLarge,
              ),
            ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: messageStyle ?? context.styleTitleMedium,
          ),
          if (onTap != null)
            Padding(
              padding: const EdgeInsets.only(top: sizeLight),
              child: ElevatedButton(
                onPressed: onTap,
                child: Text(buttonText),
              ),
            ),
        ],
      ),
    );
  }
}
