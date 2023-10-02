import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanghae_calculater/controller/calculator_controller.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() =>
                Text(
                  controller.result.value,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton('C',Text('C')),
                const SizedBox(width: 10,),
                CircleButton('AC',Text('AC')),
                const SizedBox(width: 10,),
                CircleButton('00',Text('00')),
                const SizedBox(width: 10,),
                CircleButton('/',Text('/')),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton('7',Text('7')),
                const SizedBox(width: 10,),
                CircleButton('8',Text('8')),
                const SizedBox(width: 10,),
                CircleButton('9',Text('9')),
                const SizedBox(width: 10,),
                CircleButton('*',Text('*')),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton('4',Text('4')),
                const SizedBox(width: 10,),
                CircleButton('5',Text('5')),
                const SizedBox(width: 10,),
                CircleButton('6',Text('6')),
                const SizedBox(width: 10,),
                CircleButton('-',Text('-')),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton('1',Text('1')),
                const SizedBox(width: 10,),
                CircleButton('2',Text('2')),
                const SizedBox(width: 10,),
                CircleButton('3',Text('3')),
                const SizedBox(width: 10,),
                CircleButton('+',Text('+')),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton('-',Text('-/+')),
                const SizedBox(width: 10,),
                CircleButton('0',Text('0')),
                const SizedBox(width: 10,),
                CircleButton('AA',Text('AA')),
                const SizedBox(width: 10,),
                CircleButton('=',Text('=')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget CircleButton (String value, var child) {
    return ElevatedButton(
      onPressed: () {
        controller.clickedButton(value);
      },
      child: child,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(60, 60),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.blue, // <-- Button color
        foregroundColor: Colors.white, // <-- Splash color
      ),
    );
  }
}

class CircleButton1 extends StatelessWidget {
  CircleButton1({super.key,required this.child, required this.value});
  final child;
  final String value;

  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        controller.clickedButton(value);
      },
      child: child,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(60, 60),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.blue, // <-- Button color
        foregroundColor: Colors.white, // <-- Splash color
      ),
    );

  }
}



