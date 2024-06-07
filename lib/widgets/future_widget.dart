part of 'widgets.dart';

/// A widget that displays a loading indicator while a future is being loaded,
/// then displays the result of the future once it has completed.
///
/// This widget takes the following arguments:
///
/// * `future`: The future to be loaded.
/// * `waiting`: A widget to be displayed while the future is loading (optional).
/// * `done`: A builder function that builds the widget to be displayed once
/// the future has completed and data is available (required).
/// * `errorTextStyle`: The style of the text displayed when an error occurs
/// (optional).
///
/// The widget uses a `FutureBuilder` to manage the state of the future.
/// If the future has not completed yet, the `waiting` widget is displayed.
/// If the future has completed successfully, the `done` builder function is
/// called with the data from the future.
/// If the future has completed with an error, an error message is displayed.
///
/// This widget is useful for displaying the results of asynchronous operations
/// in your Flutter application. It provides a simple and flexible way to handle
/// loading states and display results.
///
/// See also:
///
/// * `FutureBuilder`: The widget used to manage the state of the future.
/// * `CircularProgressIndicator`: The default loading indicator used when
/// `waiting` is not specified.
class FutureWidget<T> extends StatelessWidget {
  /// The future to be loaded.
  final Future<T> future;

  /// A widget to be displayed while the future is loading (optional).
  final Widget Function()? waiting;

  /// A builder function that builds the widget to be displayed once
  /// the future has completed and data is available (required).
  final Widget Function(T? data) done;

  /// The style of the text displayed when an error occurs (optional).
  final TextStyle? errorTextStyle;

  /// Creates a new instance of the FutureWidget.
  const FutureWidget({
    super.key,
    required this.future,
    this.waiting,
    required this.done,
    this.errorTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return Padding(
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

