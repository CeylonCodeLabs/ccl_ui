<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package provide basic ui helper functions, widgets and elements for every day development

## Features

1. UI helpers
2. Common widgets

## Getting started

First go through package API doc. Import necessary classes and utilize.

## Usage

For an example we have widget call CCLTable which will draw a table. 
Likewise there are multiple widgets that will help on your daily developments.

```dart
CCLTable(
  rows: [
    CCLTableRow(
      cells: [
        CCLTableCell(text: 'Column 1'),
        CCLTableCell(text: 'Column 2'),
      ],
    ),
    CCLTableRow(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      cells: [
        CCLTableCell(text: 'Row 2, Column 1'),
        CCLTableCell(text: 'Row 2, Column 2'),
      ],
    ),
  ],
),
```

## Contributing

Any bug or new feature required, feel free to file a PR.
