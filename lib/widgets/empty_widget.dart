part of 'widgets.dart';

class EmptyWidget extends StatelessWidget {
  final Widget? image;
  final Widget? button;
  final double? size;
  final String textMessage;
  final VoidCallback? onPressed;

  const EmptyWidget({
    super.key,
    this.image,
    this.button,
    this.size,
    this.textMessage = 'Data not found',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null) ...[
          image!,
          verticalSpaceLight,
        ],
        Text(
          textMessage,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        if (button != null) ...[
          verticalSpaceMedium,
          button!,
        ],
      ],
    );
  }
}
