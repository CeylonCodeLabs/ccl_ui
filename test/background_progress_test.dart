import 'package:ccl_ui/ccl_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stacked/stacked.dart';

class MockBaseViewModel extends BaseViewModel {}

void main() {
  late BaseViewModel viewModel;

  setUp(() {
    viewModel = MockBaseViewModel();
  });

  group('BackgroundProgress', () {
    testWidgets('displays child when viewModel is not busy',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: BackgroundProgress<BaseViewModel>(
                child: Text('Child Widget'),
              ),
            );
          },
        ),
      ));

      expect(find.text('Child Widget'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('displays progress indicator when viewModel is busy',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays message when provided', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  message: 'Loading...',
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('blurs background when blurBackground is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  blurBackground: true,
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.byType(BackdropFilter), findsOneWidget);
    });

    testWidgets('does not blur background when blurBackground is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  blurBackground: false,
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.byType(BackdropFilter), findsNothing);
    });

    testWidgets('displays custom progress indicator when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  progressIndicator: LinearProgressIndicator(),
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('displays child when isChildVisibleWhileBusy is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  isChildVisibleWhileBusy: true,
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.text('Child Widget'), findsOneWidget);
    });

    testWidgets('does not display child when isChildVisibleWhileBusy is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => viewModel,
          onViewModelReady: (viewModel) => viewModel.setBusy(true),
          builder:
              (BuildContext context, BaseViewModel viewModel, Widget? child) {
            return const Scaffold(
              body: SizedBox.square(
                dimension: 200,
                child: BackgroundProgress<BaseViewModel>(
                  isChildVisibleWhileBusy: false,
                  child: Text('Child Widget'),
                ),
              ),
            );
          },
        ),
      ));

      expect(find.text('Child Widget'), findsNothing);
    });
  });
}
