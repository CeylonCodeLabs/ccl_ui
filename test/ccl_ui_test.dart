import 'package:ccl_ui/ccl_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Spacing Widgets Tests', () {
    testWidgets('Horizontal space widgets render correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              horizontalSpaceTiny,
              horizontalSpaceLight,
              horizontalSpaceSmall,
              horizontalSpaceDefault,
              horizontalSpaceMedium,
              horizontalSpaceBold,
              horizontalSpaceLarge,
            ],
          ),
        ),
      ));

      expect(
          find.byType(SizedBox).evaluate().first.size?.width, equals(sizeTiny));
      expect(find.byType(SizedBox).evaluate().elementAt(1).size?.width,
          equals(sizeLight));
      expect(find.byType(SizedBox).evaluate().elementAt(2).size?.width,
          equals(sizeSmall));
      expect(find.byType(SizedBox).evaluate().elementAt(3).size?.width,
          equals(sizeDefault));
      expect(find.byType(SizedBox).evaluate().elementAt(4).size?.width,
          equals(sizeMedium));
      expect(find.byType(SizedBox).evaluate().elementAt(5).size?.width,
          equals(sizeBold));
      expect(find.byType(SizedBox).evaluate().elementAt(6).size?.width,
          equals(sizeLarge));
    });

    testWidgets('Vertical space widgets render correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              verticalSpaceTiny,
              verticalSpaceLight,
              verticalSpaceSmall,
              verticalSpaceDefault,
              verticalSpaceMedium,
              verticalSpaceBold,
              verticalSpaceLarge,
              verticalSpaceMassive,
            ],
          ),
        ),
      ));

      expect(find.byType(SizedBox).evaluate().first.size?.height,
          equals(sizeTiny));
      expect(find.byType(SizedBox).evaluate().elementAt(1).size?.height,
          equals(sizeLight));
      expect(find.byType(SizedBox).evaluate().elementAt(2).size?.height,
          equals(sizeSmall));
      expect(find.byType(SizedBox).evaluate().elementAt(3).size?.height,
          equals(sizeDefault));
      expect(find.byType(SizedBox).evaluate().elementAt(4).size?.height,
          equals(sizeMedium));
      expect(find.byType(SizedBox).evaluate().elementAt(5).size?.height,
          equals(sizeBold));
      expect(find.byType(SizedBox).evaluate().elementAt(6).size?.height,
          equals(sizeLarge));
      expect(find.byType(SizedBox).evaluate().elementAt(7).size?.height,
          equals(sizeMassive));
    });

    testWidgets('Spaced divider widget renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: spacedDivider,
        ),
      ));

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('Vertical space widget renders correctly with specified height',
        (WidgetTester tester) async {
      const double customHeight = 50.0;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: verticalSpace(customHeight),
        ),
      ));

      expect(find.byType(SizedBox).evaluate().first.size?.height,
          equals(customHeight));
    });
  });

  testWidgets('Horizontal space widget renders correctly with specified width',
      (WidgetTester tester) async {
    const double customWidth = 50.0;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: horizontalSpace(customWidth),
      ),
    ));

    expect(find.byType(SizedBox).evaluate().first.size?.width,
        equals(customWidth));
  });

  group('Responsive Sizing Tests', () {
    testWidgets('Responsive font sizes render correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: [
                Text(
                  'Small Font',
                  style:
                      TextStyle(fontSize: getResponsiveSmallFontSize(context)),
                ),
                Text(
                  'Medium Font',
                  style:
                      TextStyle(fontSize: getResponsiveMediumFontSize(context)),
                ),
                Text(
                  'Large Font',
                  style:
                      TextStyle(fontSize: getResponsiveLargeFontSize(context)),
                ),
                Text(
                  'Extra Large Font',
                  style: TextStyle(
                      fontSize: getResponsiveExtraLargeFontSize(context)),
                ),
                Text(
                  'Massive Font',
                  style: TextStyle(
                      fontSize: getResponsiveMassiveFontSize(context)),
                ),
              ],
            );
          }),
        ),
      ));

      expect(find.text('Small Font'), findsOneWidget);
      expect(find.text('Medium Font'), findsOneWidget);
      expect(find.text('Large Font'), findsOneWidget);
      expect(find.text('Extra Large Font'), findsOneWidget);
      expect(find.text('Massive Font'), findsOneWidget);
    });

    testWidgets('Responsive horizontal space renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
      final BuildContext context = tester.element(find.byType(Container));
      final width = getResponsiveHorizontalSpaceMedium(context);
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              Container(width: width),
            ],
          ),
        ),
      ));

      expect(
          find.byType(Container).evaluate().first.size?.width, equals(width));
    });
  });

  group('Screen Size Calculation Tests', () {
    testWidgets('Screen width and height calculations are correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: [
                Text(
                  'Screen Width: ${screenWidth(context)}',
                  key: const Key('screenWidthText'),
                ),
                Text(
                  'Screen Height: ${screenHeight(context)}',
                  key: const Key('screenHeightText'),
                ),
              ],
            );
          }),
        ),
      ));

      expect(find.byKey(const Key('screenWidthText')), findsOneWidget);
      expect(find.byKey(const Key('screenHeightText')), findsOneWidget);
    });

    testWidgets('Screen width and height fractions render correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: [
                Text(
                  'Screen Width Fraction: ${screenWidthFraction(context)}',
                  key: const Key('screenWidthFractionText'),
                ),
                Text(
                  'Screen Height Fraction: ${screenHeightFraction(context)}',
                  key: const Key('screenHeightFractionText'),
                ),
              ],
            );
          }),
        ),
      ));

      expect(find.byKey(const Key('screenWidthFractionText')), findsOneWidget);
      expect(find.byKey(const Key('screenHeightFractionText')), findsOneWidget);
    });

    testWidgets('Screen size fractions based on dividedBy render correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: [
                Text(
                  'Half Screen Width: ${halfScreenWidth(context)}',
                  key: const Key('halfScreenWidthText'),
                ),
                Text(
                  'Third Screen Width: ${thirdScreenWidth(context)}',
                  key: const Key('thirdScreenWidthText'),
                ),
                Text(
                  'Quarter Screen Width: ${quarterScreenWidth(context)}',
                  key: const Key('quarterScreenWidthText'),
                ),
              ],
            );
          }),
        ),
      ));

      expect(find.byKey(const Key('halfScreenWidthText')), findsOneWidget);
      expect(find.byKey(const Key('thirdScreenWidthText')), findsOneWidget);
      expect(find.byKey(const Key('quarterScreenWidthText')), findsOneWidget);
    });

    testWidgets('Flexible space bar expanded height is correct',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Column(
              children: [
                Text(
                  'Flexible Space Bar Expanded Height: ${flexibleSpaceBarExpandedHeight(context)}',
                  key: const Key('flexibleSpaceBarExpandedHeightText'),
                ),
              ],
            );
          }),
        ),
      ));

      expect(find.byKey(const Key('flexibleSpaceBarExpandedHeightText')),
          findsOneWidget);
    });

    testWidgets('Title horizontal padding is correct',
        (WidgetTester tester) async {
      final ScrollController scrollController = ScrollController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(
                    horizontal: titleHorizontalPadding(scrollController, 200.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

      expect(
          titleHorizontalPadding(scrollController, 200.0), equals(sizeMedium));
    });

    // testWidgets('Title color is correct', (WidgetTester tester) async {
    //   await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
    //   final BuildContext context = tester.element(find.byType(Container));
    //
    //   final ScrollController scrollController = ScrollController();
    //
    //   await tester.pumpWidget(MaterialApp(
    //     home: Scaffold(
    //       body: CustomScrollView(
    //         controller: scrollController,
    //         slivers: [
    //           SliverAppBar(
    //             expandedHeight: 200.0,
    //             flexibleSpace: FlexibleSpaceBar(
    //               title: Text(
    //                 'Title',
    //                 style: TextStyle(
    //                     color: titleColor(context, scrollController, 200.0)),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ));
    //
    //   expect(
    //       titleColor(context, scrollController, 200.0), equals(Colors.white));
    // });
  });
}
