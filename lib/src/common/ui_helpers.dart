part of 'common.dart';

/// Defines a constant for tiny size, which is 4.0.
const double sizeTiny = 4.0;

/// Defines a constant for light size, which is 8.0.
const double sizeLight = 8.0;

/// Defines a constant for small size, which is 12.0.
const double sizeSmall = 12.0;

/// Defines a constant for default size, which is 16.0.
const double sizeDefault = 16.0;

/// Defines a constant for medium size, which is 24.0.
const double sizeMedium = 24.0;

/// Defines a constant for bold size, which is 36.0.
const double sizeBold = 36.0;

/// Defines a constant for large size, which is 52.0.
const double sizeLarge = 52.0;

/// Defines a constant for massive size, which is 120.0.
const double sizeMassive = 120.0;

/// Creates a horizontal space widget with [sizeTiny] width.
const Widget horizontalSpaceTiny = SizedBox(width: sizeTiny);

/// Creates a horizontal space widget with [sizeLight] width.
const Widget horizontalSpaceLight = SizedBox(width: sizeLight);

/// Creates a horizontal space widget with [sizeSmall] width.
const Widget horizontalSpaceSmall = SizedBox(width: sizeSmall);

/// Creates a horizontal space widget with [sizeDefault] width.
const Widget horizontalSpaceDefault = SizedBox(width: sizeDefault);

/// Creates a horizontal space widget with [sizeMedium] width.
const Widget horizontalSpaceMedium = SizedBox(width: sizeMedium);

/// Creates a horizontal space widget with [sizeBold] width.
const Widget horizontalSpaceBold = SizedBox(width: sizeBold);

/// Creates a horizontal space widget with [sizeLarge] width.
const Widget horizontalSpaceLarge = SizedBox(width: sizeLarge);

/// Creates a vertical space widget with [sizeTiny] height.
const Widget verticalSpaceTiny = SizedBox(height: sizeTiny);

/// Creates a vertical space widget with [sizeLight] height.
const Widget verticalSpaceLight = SizedBox(height: sizeLight);

/// Creates a vertical space widget with [sizeSmall] height.
const Widget verticalSpaceSmall = SizedBox(height: sizeSmall);

/// Creates a vertical space widget with [sizeDefault] height.
const Widget verticalSpaceDefault = SizedBox(height: sizeDefault);

/// Creates a vertical space widget with [sizeMedium] height.
const Widget verticalSpaceMedium = SizedBox(height: sizeMedium);

/// Creates a vertical space widget with [sizeBold] height.
const Widget verticalSpaceBold = SizedBox(height: sizeBold);

/// Creates a vertical space widget with [sizeLarge] height.
const Widget verticalSpaceLarge = SizedBox(height: sizeLarge);

/// Creates a vertical space widget with [sizeMassive] height.
const Widget verticalSpaceMassive = SizedBox(height: sizeMassive);

/// Creates a spaced divider widget with medium vertical space.
const Widget spacedDivider = Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: sizeTiny),
    verticalSpaceMedium,
  ],
);

/// Creates a vertical space widget with the specified [height].
Widget verticalSpace(double height) => SizedBox(height: height);

/// Creates a horizontal space widget with the specified [width].
Widget horizontalSpace(double width) => SizedBox(width: width);

/// Gets the screen width of the current context.
@Deprecated('Use context.screanWidth instead')
double screenWidth(BuildContext context) => sw(context);

/// Gets the screen width of the current context.
@Deprecated('Use context.sw instead')
double sw(BuildContext context) => MediaQuery.sizeOf(context).width;

/// Gets the screen height of the current context.
@Deprecated('Use context.screenHeight instead')
double screenHeight(BuildContext context) => sh(context);

/// Gets the screen height of the current context.
@Deprecated('Use context.sh instead')
double sh(BuildContext context) => MediaQuery.sizeOf(context).height;

/// Gets the fraction of the screen height considering [dividedBy] and [offsetBy],
/// with a maximum of [max].
double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((context.sh - offsetBy) / dividedBy, max);

/// Gets the fraction of the screen width considering [dividedBy] and [offsetBy],
/// with a maximum of [max].
double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((context.sw - offsetBy) / dividedBy, max);

/// Gets half of the screen width of the current context.
double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

/// Gets a third of the screen width of the current context.
double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

/// Gets a quarter of the screen width of the current context.
double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

/// Gets a responsive horizontal space with medium size based on the screen width.
double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);

/// Gets a responsive small font size based on the screen width.
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

/// Gets a responsive medium font size based on the screen width.
double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

/// Gets a responsive large font size based on the screen width.
double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

/// Gets a responsive extra large font size based on the screen width.
double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

/// Gets a responsive massive font size based on the screen width.
double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

/// Gets a responsive font size based on the screen width and the specified [fontSize] and [max].
double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

/// Gets a fraction of the screen width based on the specified [fraction], [offsetBy], and [max] values.
double getScreenWidthFraction(BuildContext context,
        {double fraction = 1.0, double offsetBy = 0, double max = 3000}) =>
    min((context.sw - offsetBy) / fraction, max);

/// Gets a fraction of the screen height based on the specified [fraction], [offsetBy], and [max] values.
double getScreenHeightFraction(BuildContext context,
        {double fraction = 1.0, double offsetBy = 0, double max = 3000}) =>
    min((context.sh - offsetBy) / fraction, max);

/// Gets the expanded height of the FlexibleSpaceBar based on the current screen
/// type and the specified [mobile] and [tablet] values.
double flexibleSpaceBarExpandedHeight(BuildContext context,
        {int mobile = 5, int tablet = 4}) =>
    screenHeightFraction(context,
        dividedBy: getValueForScreenType(
          context: context,
          mobile: mobile,
          tablet: tablet,
        ));

/// Calculates the horizontal padding for the title based on the scroll controller
/// and the expanded height.
double titleHorizontalPadding(
    ScrollController scrollController, double expandedHeight) {
  const kBasePadding = sizeMedium;
  const kMultiplier = 1.0;

  if (scrollController.hasClients) {
    if (scrollController.offset < (expandedHeight / 2)) {
      // In case 50%-100% of the expanded height is viewed
      return kBasePadding;
    }

    if (scrollController.offset > (expandedHeight - kToolbarHeight)) {
      // In case 0% of the expanded height is viewed
      return (expandedHeight / 2 - kToolbarHeight) * kMultiplier + kBasePadding;
    }

    // In case 0%-50% of the expanded height is viewed
    return (scrollController.offset - (expandedHeight / 2)) * kMultiplier +
        kBasePadding;
  }

  return kBasePadding;
}

/// Determines the title color based on the scroll controller and the expanded height.
Color titleColor(BuildContext context, ScrollController scrollController,
    double expandedHeight) {
  if (scrollController.hasClients) {
    if (scrollController.offset < (expandedHeight / 2)) {
      // In case 50%-100% of the expanded height is viewed
      return context.colors.onPrimary;
    }

    if (scrollController.offset > (expandedHeight - kToolbarHeight)) {
      // In case 0% of the expanded height is viewed
      return context.isDarkMode
          ? context.colors.onSurface
          : context.colors.onPrimary;
    }

    // In case 0%-50% of the expanded height is viewed
    return context.colors.onPrimary;
  }

  return context.colors.onPrimary;
}
