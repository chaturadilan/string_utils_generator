// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_util_example.dart';

// **************************************************************************
// StringUtilsGenerator
// **************************************************************************

extension StringHelpersStringUtils on String {
  String reverse() {
    return split('').reversed.join();
  }

  String toCamelCase() {
    return split(' ')
        .asMap()
        .entries
        .map((entry) => entry.key == 0
            ? entry.value.toLowerCase()
            : entry.value.capitalize())
        .join('');
  }

  String capitalize() {
    return isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
  }

  String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(
        length,
        (index) => chars[(DateTime.now().millisecondsSinceEpoch + index) %
            chars.length]).join('');
  }

  String capitalizeEachWord() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}
