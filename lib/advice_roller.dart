import 'dart:math';
import 'package:flutter/material.dart';
import 'advice_text.dart';

final randomizer = Random();

class AdviceRoller extends StatefulWidget {
  const AdviceRoller({super.key});

  @override
  State<AdviceRoller> createState() {
    return _AdviceRollerState();
  }
}

class _AdviceRollerState extends State<AdviceRoller> {
  var activeAdviceImage = 'assets/images/advice1.png';
  var activeAdviceText = 'Нажми кнопку, чтобы получить совет!';

  void rollAdvice() {
    setState(() {
      var randomNumber = randomizer.nextInt(3) + 1;
      activeAdviceImage = 'assets/images/advice$randomNumber.png';
      
      var advices = [
        'Никогда не сдавайся, даже если ошибся.',
        'Выпей стакан воды и сделай перерыв на 5 минут.',
        'Улыбнись! Это повышает настроение.',
        'Разбей большую задачу на маленькие шаги.',
        'Слушай больше, чем говоришь.',
        'Ложись спать до полуночи для продуктивного дня.',
      ];
      
      activeAdviceText = advices[randomizer.nextInt(advices.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeAdviceImage,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 30),
        AdviceText(activeAdviceText), 
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollAdvice,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          child: const Text("Получить совет"),
        ),
      ],
    );
  }
}