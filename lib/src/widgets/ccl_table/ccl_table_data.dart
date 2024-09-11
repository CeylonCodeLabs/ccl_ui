part of 'ccl_table.dart';

/// Represents a row in a CCLTable widget.
///
/// This class holds information about the decoration, padding, and cells of a table row.
///
/// ## Arguments:
///
/// * `cells`: A list of `CCLTableCell` objects representing the cells in the row.
/// * `decoration`: An optional decoration to be applied to the entire row.
/// * `padding`: An optional padding to be applied to all cells in the row.
class CCLTableRow {
  /// The decoration to be applied to the entire row.
  final Decoration? decoration;

  /// A list of `CCLTableCell` objects representing the cells in the row.
  final List<CCLTableCell> cells;

  /// An optional padding to be applied to all cells in the row.
  final EdgeInsetsGeometry? padding;

  /// Creates a new instance of the CCLTableRow class.
  CCLTableRow({required this.cells, this.decoration, this.padding});
}

/// Represents a cell in a CCLTable widget.
///
/// This class holds information about the text, alignment, style, max lines, text overflow,
/// padding, decoration, and child of a table cell.
///
/// ## Arguments:
///
/// * `text`: The text to be displayed in the cell (optional, mutually exclusive with child).
/// * `textAlign`: The alignment of the text in the cell.
/// * `style`: The style of the text in the cell.
/// * `maxLines`: The maximum number of lines to display in the cell.
/// * `textOverflow`: How to handle text that overflows the cell.
/// * `padding`: An optional padding to be applied to the cell.
/// * `decoration`: An optional decoration to be applied to the cell.
/// * `child`: A custom widget to be displayed in the cell (optional, mutually exclusive with text).
///
/// ## Asserts:
///
/// * Only one of `text` and `child` can be provided at a time.
/// * Either `text` or `child` must be provided.
class CCLTableCell {
  /// The text to be displayed in the cell.
  final String? text;

  /// Tooltip to shown using [Tooltip]
  final String? tooltip;

  /// The alignment of the text in the cell.
  final TextAlign? textAlign;

  /// The style of the text in the cell.
  final TextStyle? style;

  /// The maximum number of lines to display in the cell.
  final int? maxLines;

  /// How to handle text that overflows the cell.
  final TextOverflow? textOverflow;

  /// An optional padding to be applied to the cell.
  final EdgeInsetsGeometry? padding;

  /// An optional decoration to be applied to the cell.
  final Decoration? decoration;

  /// A custom widget to be displayed in the cell.
  final Widget? child;

  /// Creates a new instance of the CCLTableCell class.
  CCLTableCell({
    this.text,
    this.tooltip,
    this.textAlign,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.padding,
    this.decoration,
    this.child,
  })  : assert(text == null || child == null,
            'Only text or child should provided.'),
        assert(text != null || child != null,
            'Either text or child should provided');
}
