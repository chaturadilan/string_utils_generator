library string_utils_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart' as analizer;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:string_utils_generator/annotation.dart';

Builder stringUtilsBuilder(BuilderOptions options) => SharedPartBuilder(
      [StringUtilsGenerator()],
      'string_utils_genrator',
    );

class StringUtilsGenerator extends GeneratorForAnnotation<GenerateStringUtils> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    analizer.Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is analizer.ClassElement) {
      final className = element.name;

      // Generate utility methods
      return '''
        extension ${className}StringUtils on String {
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
              return isEmpty ? this : '\${this[0].toUpperCase()}\${substring(1)}';
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
      ''';
    }

    return '';
  }
}
