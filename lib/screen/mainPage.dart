
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanghae_calculater/class/class.dart';
import 'package:hanghae_calculater/controller/calculator_controller.dart';
import 'package:hanghae_calculater/layout/font.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});


  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    Get.put(CalculatorController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 300,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 계산기 페이지
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('계산기',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0
                              )
                          ),
                          height: 650,
                          width: 400,
                          child: Column(
                            children: [
                              dropDownButtons(),
                              Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() =>
                                          Text(
                                            controller.result.value,
                                            style: const TextStyle(
                                              fontSize: 30,
                                            ),
                                          ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('KRW ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text('받음 ',
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                      ),
                                      SizedBox(width: 10,)
                                    ],
                                  )
                                ],
                              ),
                              Obx(() =>
                                  Text(
                                    controller.formula.value,
                                    style: const TextStyle(
                                      fontSize: 28,

                                    ),
                                  ),
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  circleButton('C'),
                                  const SizedBox(width: 10,),
                                  circleButton('AC'),
                                  const SizedBox(width: 10,),
                                  circleButton('저장'),
                                  const SizedBox(width: 10,),
                                  circleButton('÷'),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  circleButton('7'),
                                  const SizedBox(width: 10,),
                                  circleButton('8'),
                                  const SizedBox(width: 10,),
                                  circleButton('9'),
                                  const SizedBox(width: 10,),
                                  circleButton('X'),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  circleButton('4'),
                                  const SizedBox(width: 10,),
                                  circleButton('5'),
                                  const SizedBox(width: 10,),
                                  circleButton('6'),
                                  const SizedBox(width: 10,),
                                  circleButton('-'),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  circleButton('1'),
                                  const SizedBox(width: 10,),
                                  circleButton('2'),
                                  const SizedBox(width: 10,),
                                  circleButton('3'),
                                  const SizedBox(width: 10,),
                                  circleButton('+'),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  circleButton('0'),
                                  const SizedBox(width: 10,),
                                  circleButton('00'),
                                  const SizedBox(width: 10,),
                                  circleButton('000'),
                                  const SizedBox(width: 10,),
                                  circleButton('='),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 200,),

                    // 랭크 페이지
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('랭크',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2.0
                              )
                            ),
                            height: 650,
                            width: 400,
                            child: Obx(() {
                              final results = controller.results;
                              results.sort((a, b) => b.moneyGiven.compareTo(a.moneyGiven)); // 정렬
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                padding: const EdgeInsets.all(8),
                                itemCount: results.length, // 아이템 수는 results 리스트의 길이로 설정
                                itemBuilder: (BuildContext context, int index) {
                                  GivenMoney resultData = results[index];

                                  // 순위 에 따라 다른 이미지 설정
                                  Widget image;
                                  if (index == 0) {
                                    image = Image.asset('images/gold.png',
                                      width: 50,
                                      height: 50,);
                                  } else if (index == 1) {
                                    image = Image.asset('images/silver.png',
                                      width: 50,
                                      height: 50,);
                                  } else if (index == 2) {
                                    image = Image.asset('images/bronze.png',
                                      width: 50,
                                      height: 50,);
                                  } else {
                                    image = Text('${index+1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25
                                    ),);
                                  }
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.blue,
                                                width: 2.0
                                            )
                                        ),
                                        height: 50,
                                        width: 380,
                                        child: Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(width: 10,),
                                                  image
                                                ]),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const SizedBox( width: 20,),
                                                Column(
                                                  children: [
                                                    Text(resultData.name,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                    ),),
                                                    Text('${NumberFormat('#,###').format(resultData.moneyGiven)} ₩')
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20,)
                                    ],
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 300,),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownButtons () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 부모님 선택
        Obx(() => DropdownButton<String>(
          value: controller.parentValue.value,
          elevation: 16,
          style: dropdownStyle(),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            controller.parentValue.value = value!;
            isMother(controller.parentValue.value)
                ? controller.motherRelativeValue.value = controller.motherRelativeValue.value
                : controller.fatherRelativeValue.value = controller.fatherRelativeValue.value;
          },
          items: controller.parent.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        ),
        const Text(' 쪽 의 '),
        // 몇번째 형제인지 선택
        Obx(() => DropdownButton<String>(
          value: controller.listValue.value,
          elevation: 16,
          style: dropdownStyle(),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            controller.listValue.value = value!;
          },
          items: controller.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        ),
        const SizedBox(width: 20,),
        // 관계 선택
        Obx(() => DropdownButton<String>(
          value: isMother(controller.parentValue.value)
              ? controller.motherRelativeValue.value
              : controller.fatherRelativeValue.value,
          elevation: 16,
          style: dropdownStyle(),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            isMother(controller.parentValue.value)
                ? controller.motherRelativeValue.value = value!
                : controller.fatherRelativeValue.value = value!;

            controller.finalRelativeValue.value = value;
          },
          items:
          isMother(controller.parentValue.value)
              ?controller.motherRelative.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()
              :controller.fatherRelative.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        ),
        const Text('에게')
      ],
    );
  }

  Widget circleButton (String value) {
    return ElevatedButton(
      onPressed: () {
        controller.clickedButton(value);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(70, 70),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      child: Text(value,
        style: const TextStyle(
            fontSize: 16
        ),),
    );
  }
}
// 선택된것이 '엄마'인지 확인하는 코드
bool isMother(String value) {
  if (value == '엄마') {
    return true;
  } else {
    return false;
  }
}

