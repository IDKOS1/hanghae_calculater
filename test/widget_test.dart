import 'dart:io';
import 'package:math_parser/math_parser.dart';

void main() {
  final stringExpression = '(2*x)^(e^3 + 4) + y';
  print('Expression: $stringExpression');

  final definable = MathNodeExpression.getPotentialDefinable(
    stringExpression,
    hideBuiltIns: true,
  );

  final expression = MathNodeExpression.fromString(
    stringExpression,
    variableNames: definable.variables,
    isImplicitMultiplication: true,
  );

  // Ask user to define variables
  final variableValues = <String, double>{};
  for (final variable in definable.variables) {
    print('Enter value for $variable:');
    final double value = double.parse(
      stdin.readLineSync() as String,
    );
    variableValues[variable] = value;
  }

  final result = expression.calc(
    MathVariableValues(variableValues),
  );

  print('Result: $result');
}

