part of '../common.dart';

extension FontWeightExtension on TextStyle? {
  TextStyle? get w100 => this?.copyWith(fontWeight: FontWeight.w100);
  TextStyle? get w200 => this?.copyWith(fontWeight: FontWeight.w200);
  TextStyle? get w300 => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? get w400 => this?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get w500 => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get w600 => this?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get w700 => this?.copyWith(fontWeight: FontWeight.w700);
  TextStyle? get w800 => this?.copyWith(fontWeight: FontWeight.w800);
  TextStyle? get w900 => this?.copyWith(fontWeight: FontWeight.w900);
  TextStyle? get wNormal => this?.copyWith(fontWeight: FontWeight.normal);
  TextStyle? get wBold => this?.copyWith(fontWeight: FontWeight.bold);
}