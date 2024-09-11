part of 'widgets.dart';

/// A simple widget for debugging and testing purposes.
///
/// This widget takes the following argument:
///
/// * `name`: A unique identifier for the widget.
///
/// The widget displays a container with the provided `name` centered as text.
/// It also logs the build event with the name for debugging purposes.
///
/// This widget is useful for testing various aspects of your Flutter application.
/// You can use it to:
///
/// * Verify that widgets are being built correctly.
/// * Test the functionality of different parts of your UI.
/// * Debug layout and sizing issues.
/// * Log information about widget creation and destruction.
///
/// See also:
///
/// * `Container`: The widget used to display the text.
/// * `Center`: The widget used to center the text.
/// * `Text`: The widget used to display the name.
/// * `Log`: The class used to log the build event.
class DummyView extends StatelessWidget {
  /// A unique identifier for the widget.
  final String name;

  /// A constant identifier for logging purposes.
  // ignore: constant_identifier_names
  static const TAG = 'DummyView';

  /// Creates a new instance of the DummyView widget.
  DummyView({required this.name}) : super(key: Key(name));

  @override
  Widget build(BuildContext context) {
    // Log the build event.
    Log.i(TAG, 'Build : $name');

    return Container(
      key: ValueKey<String>(name), // Use the name for the key.
      child: Center(
        child: Text(name), // Display the name as text.
      ),
    );
  }
}
