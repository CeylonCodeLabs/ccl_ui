part of 'widgets.dart';

/// A widget that displays a loading indicator while a stream is being listened to,
/// then displays the data from the stream once it has emitted a value.
///
/// This widget takes the following arguments:
///
/// * `stream`: The stream to be listened to.
/// * `initialData`: The initial data to display before the stream emits a value (optional).
/// * `waiting`: A widget to be displayed while the stream is waiting for data (optional).
/// * `error`: A builder function that builds the widget to be displayed when an error occurs (optional).
/// * `done`: A builder function that builds the widget to be displayed once
/// the stream emits a value (required).
/// * `showError`: Whether to show the error message (default: true).
/// * `errorTextStyle`: The style of the text displayed when an error occurs (optional).
///
/// The widget uses a `StreamBuilder` to manage the state of the stream.
/// If the stream has not emitted a value yet, the `waiting` widget is displayed.
/// If the stream has emitted a value, the `done` builder function is called with the data from the stream.
/// If the stream has emitted an error, an error message is displayed.
///
/// This widget is useful for displaying the results of asynchronous operations
/// in your Flutter application that utilize streams. It provides a simple and flexible way to handle
/// loading states and display data.
///
/// See also:
///
/// * `StreamBuilder`: The widget used to manage the state of the stream.
/// * `CircularProgressIndicator`: The default loading indicator used when
/// `waiting` is not specified.
class StreamWidget<T> extends StatelessWidget {
  /// The stream to be listened to.
  final Stream<T> stream;

  /// The initial data to display before the stream emits a value (optional).
  final T? initialData;

  /// If null, will use default Centered Circular Progress Indicator
  final Widget Function()? waiting;

  /// A builder function that builds the widget to be displayed when an error occurs (optional).
  final Widget Function(Object? error)? error;

  /// A builder function that builds the widget to be displayed once
  /// the stream emits a value (required).
  final Widget Function(T? data) done;

  /// Whether to show the error message (default: true).
  final bool showError;

  /// The style of the text displayed when an error occurs (optional).
  final TextStyle? errorTextStyle;

  /// Creates a new instance of the StreamWidget.
  const StreamWidget({
    super.key,
    required this.stream,
    required this.done,
    this.initialData,
    this.waiting,
    this.error,
    this.showError = true,
    this.errorTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return !showError
              ? const SizedBox.shrink()
              : error != null
                  ? error!(snapshot.error)
                  : Padding(
                      padding: const EdgeInsets.all(sizeDefault),
                      child: Text(
                        '${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: errorTextStyle,
                      ),
                    );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return waiting == null
                ? const Center(child: CircularProgressIndicator())
                : waiting!();
          case ConnectionState.active:
          case ConnectionState.done:
            return done(snapshot.data);
        }
      },
    );
  }
}
