part of '../widgets.dart';

/// A widget that displays a table.
///
/// This widget takes a list of `CCLTableRow` objects as its main argument.
/// Each row object defines the cells in the row, along with their decoration
/// and padding.
///
/// ## Arguments:
///
/// * `rows`: A list of `CCLTableRow` objects representing the rows of the table.
/// * `columnWidths`: An optional map that defines the width of each column.
/// * `defaultColumnWidth`: The default width for columns that are not specified
/// in the `columnWidths` map.
/// * `textDirection`: The text direction of the table.
/// * `border`: The border to draw around the table.
/// * `defaultVerticalAlignment`: The default vertical alignment of the cells in the table.
/// * `textBaseline`: The baseline for aligning the text in the cells.
///
/// ## Usage:
///
/// ```
/// CCLTable(
///   rows: [
///     CCLTableRow(
///       cells: [
///         CCLTableCell(text: 'Column 1'),
///         CCLTableCell(text: 'Column 2'),
///       ],
///     ),
///     CCLTableRow(
///       decoration: BoxDecoration(color: Colors.grey.shade200),
///       cells: [
///         CCLTableCell(text: 'Row 2, Column 1'),
///         CCLTableCell(text: 'Row 2, Column 2'),
///       ],
///     ),
///   ],
/// ),
/// ```
class CCLTable extends StatelessWidget {
  /// A list of `CCLTableRow` objects representing the rows of the table.
  final List<CCLTableRow> rows;

  /// An optional map that defines the width of each column.
  final Map<int, TableColumnWidth>? columnWidths;

  /// The default width for columns that are not specified in the `columnWidths` map.
  final TableColumnWidth defaultColumnWidth;

  /// The text direction of the table.
  final TextDirection? textDirection;

  /// The border to draw around the table.
  final TableBorder? border;

  /// The default vertical alignment of the cells in the table.
  final TableCellVerticalAlignment defaultVerticalAlignment;

  /// The baseline for aligning the text in the cells.
  final TextBaseline? textBaseline;

  /// Creates a new instance of the CCLTable class.
  const CCLTable({
    super.key,
    required this.rows,
    this.columnWidths,
    this.defaultColumnWidth = const FlexColumnWidth(),
    this.textDirection,
    this.border,
    this.defaultVerticalAlignment = TableCellVerticalAlignment.top,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
  });

  @override
  Widget build(BuildContext context) {
    final tableRows = rows.map((row) {
      return TableRow(
        decoration: row.decoration,
        children: row.cells.map((cell) {
          final child = cell.text.isNotNullOrEmpty
              ? Text(
                  cell.text!,
                  textAlign: cell.textAlign,
                  style: cell.style,
                  overflow: cell.textOverflow,
                  maxLines: cell.maxLines,
                )
              : cell.child;

          return Container(
            padding: row.padding != null && cell.padding != null
                ? row.padding!.add(cell.padding!)
                : row.padding ?? cell.padding ?? EdgeInsets.zero,
            decoration: cell.decoration,
            child: cell.tooltip.isNotNullOrEmpty
                ? Tooltip(
                    message: cell.tooltip,
                    child: child,
                  )
                : child,
          );
        }).toList(growable: false),
      );
    }).toList(growable: false);

    return Table(
      children: tableRows,
      columnWidths: columnWidths,
      defaultColumnWidth: defaultColumnWidth,
      textDirection: textDirection ?? Directionality.of(context),
      border: border,
      defaultVerticalAlignment: defaultVerticalAlignment,
      textBaseline: textBaseline,
    );
  }
}
