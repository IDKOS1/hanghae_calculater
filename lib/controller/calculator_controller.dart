import 'package:get/get.dart';
import 'package:hanghae_calculater/class/class.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  static CalculatorController get to => Get.find();

  RxString formula = '0'.obs;         // 계산식 변수
  RxString result = '0'.obs;          // 계산식 결과

  List<String> parent = <String>['엄마', '아빠'];
  RxString parentValue = '엄마'.obs;

  List<String> list = <String>['선택안함', '첫 째','둘 째','셋 째','넷 째','다섯 째', '큰', '작은'];
  RxString listValue = '선택안함'.obs;

  // parent가 엄마일때의 관계 설정
  List<String> motherRelative = <String>['외할아버지', '외할머니', '외삼촌','외숙모', '이모', '이모부'];
  RxString motherRelativeValue = '외할아버지'.obs;

  //parent가 아빠일때의 관계 설정
  List<String> fatherRelative = <String>['할아버지', '할머니', '삼촌', '숙모', '고모', '고모부'];
  RxString fatherRelativeValue = '할아버지'.obs;

  // 최종 관계 설정
  RxString finalRelativeValue = '외할아버지'.obs;

  List<String> operator = ['+', '-', 'X', '/'];

  RxList results = [].obs;

  // 계산기의 기능을 구현한 코드
  void clickedButton(String value) {
    if (value == 'AC') {
      clearResult();
    } else if (value == 'C') {
      removeLastCharacter();
    } else if (value == '+' || value == '-' || value == 'X' || value == '÷') {
      handleOperator(value);
    } else if (value == '=') {
      equalPressed();
    } else if (value == '저장') {
      savePressed(result.value);
    }else {
      handleDigit(value);
    }
  }

  // 결과값 초기화
  void clearResult() {
    formula.value = '0';
  }

  // 마지막 문자열 지우기 (빈 문자열일 경우 0으로 초기화)
  void removeLastCharacter() {
    if (formula.value != '0' && formula.value.isNotEmpty) {
      formula.value = formula.value.substring(0, formula.value.length - 1);
      if (formula.value.isEmpty) {
        formula.value = '0';
      }
    }
  }

  //연산자 입력시 처리하는 코드
  void handleOperator(String value) {
    String lastCharacter = getLastCharacter();
    if (operator.contains(lastCharacter)) {
      formula.value = formula.value.substring(0, formula.value.length - 1);
    } else if (formula.value == '0') {
      return;
    }
    formula.value += value;
  }

  // 숫자 입력시 처리하는 코드
  void handleDigit(String value) {
    if (formula.value == '0') {
      if (value == '0' || value == '00' || value == '000') {
        return;
      }
      formula.value = '';
    } else if(operator.contains(getLastCharacter())) {
      if (value == '0' || value == '00' || value == '000') {
        return;
      }
    }
    formula.value += value;
  }

  // 결과값을 출력하는 코드
  void equalPressed() {
    if (operator.contains(getLastCharacter())) {
      result.value = 'alert';
      return;
    }

    String input = formula.value.replaceAll('X', '*');
    String finalUserInput = input.replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    int eval = exp.evaluate(EvaluationType.REAL, ContextModel()).toInt();


    // eval이 10자리를 넘어갈 때 'infinity'로 처리
    if (eval.toString().length>10) {
      result.value = 'infinity';
    }
    // eval이 음수일 때 0으로 처리
    else if (eval.isNegative) {
      result.value = '0';
    }
    // 예외 결과값 출력 시 '숫자 아님'으로 표시
    else if (eval.isNaN) {
      result.value = '숫자 아님';
    }
    // eval 값을 정수로 설정, 숫자 3자리마다 쉼표(,) 추가
    else {
      result.value = NumberFormat('#,###').format(eval);
    }
  }

  // 마지막 문자열을 가져오는 코드
  String getLastCharacter() {
    return formula.value.substring(formula.value.length - 1);
  }

  // 저장버튼을 눌렀을때의 코드
  void savePressed(String value) {
    String? finalListValue = '';

    // 쉼표 제거
    int intValue = int.parse(value.replaceAll(',', ''));

    // result.value 가 0일때 무시
    if (result.value == '0') {
      return;
    }

    // listValue 변수가 '선택안함' 일 때 공백
    if (listValue.value != '선택안함') {
      finalListValue = listValue.value;
    }
    String finalName = finalListValue + finalRelativeValue.value;

    // results 리스트중 finalName 변수와 동일한 이름을 찾음
    for (GivenMoney givenMoney in results) {
      if (givenMoney.name.trim() == finalName) {
        // 동일한 이름을 찾으면 액수 더하기
        givenMoney.moneyGiven += intValue;
        // 결과값 초기화
        formula.value = '0';
        result.value = '0';
        results.add(
          GivenMoney('', 0),
        );
        results.removeLast();
        return;
      }
    }

    // 동일한 이름을 찾지 못하면 새로운 요소 추가
    results.add(
      GivenMoney('$finalListValue ${finalRelativeValue.value}', intValue),
    );

    // 결과값 초기화
    formula.value = '0';
    result.value = '0';
  }
}
