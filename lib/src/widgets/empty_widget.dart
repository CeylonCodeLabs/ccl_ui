part of 'widgets.dart';

class EmptyWidget extends StatelessWidget {
  @Deprecated('Use EmptyWidgetSettings settings')
  final Widget? image;
  final Widget? button;
  @Deprecated('Use EmptyWidgetSettings settings')
  final String? textMessage;
  final EmptyWidgetSettings? settings;

  const EmptyWidget({
    super.key,
    this.image,
    this.button,
    this.textMessage,
    this.settings,
  });

  @override
  Widget build(BuildContext context) {
    final defaultSettings = CCLUiConfigurator.maybeOfEmptyWidget(context) ??
        EmptyWidgetSettings.defaultSettings(context);

    final effectiveSettings = settings ?? defaultSettings;

    final emptyGraphic = image ?? effectiveSettings.emptyGraphic;
    final title = effectiveSettings.title;
    final message = textMessage ?? effectiveSettings.message;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (emptyGraphic != null) ...[
          emptyGraphic,
          verticalSpaceDefault,
        ],
        if (title.isNotNullAndNotEmpty) ...[
          Text(
            title!,
            textAlign: TextAlign.center,
            style: effectiveSettings.titleStyle,
          ),
          verticalSpaceLight,
        ],
        Text(
          message,
          textAlign: TextAlign.center,
          style: effectiveSettings.messageStyle,
        ),
        if (button != null) ...[
          verticalSpaceMedium,
          button!,
        ],
      ],
    );
  }
}
