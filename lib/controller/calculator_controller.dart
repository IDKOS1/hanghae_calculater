import 'package:get/get.dart';

class CalculatorController extends GetxController {
  static CalculatorController get to => Get.find();

  RxString result = '0'.obs;

  void clickedButton (String value) {
    if (value == 'AC') {
      result.value = '0';
    } else if (value == 'C') {
      if (result.value != '0' && result.value.isNotEmpty) {
        result.value = result.value.substring(0, result.value.length - 1);
      }
    } else {
      if(result.value == '0') {
        result.value = '';
      }
      result.value += value;
    }
    print(result.value);
  }
}
