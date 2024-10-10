import 'package:bmi_calculator/models/bmi_logic.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:bmi_calculator/widgets/age_button.dart';
import 'package:bmi_calculator/widgets/calc_button.dart';
import 'package:bmi_calculator/widgets/gender_icon.dart';
import 'package:bmi_calculator/widgets/main_widget.dart';
import 'package:bmi_calculator/widgets/round_icon.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222337),
      appBar: AppBar(
        backgroundColor: const Color(0xff222337),
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MainWidget(
                      selectedGender == Gender.male
                          ? const Color(0xff242639)
                          : const Color(0xff323243),
                      const GenderIcon(icon: Icons.male, label: "Male"), () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  }),
                ),
                Expanded(
                  child: MainWidget(
                      selectedGender == Gender.female
                          ? const Color(0xff242639)
                          : const Color(0xff323243),
                      const GenderIcon(icon: Icons.female, label: "Female"),
                      () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: MainWidget(
                const Color(0xff323243),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: const Color(0xFF8D8E98),
                        activeTickMarkColor: Colors.white,
                        thumbColor: const Color(0xFFCF4D68),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                () {}),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MainWidget(
                      const Color(0xff323243),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      () {}),
                ),
                const Expanded(
                  child: AgeButton(),
                ),
              ],
            ),
          ),
          CalcButton(
            title: 'CALCULATE',
            onTap: () {
              BmiLogic calc = BmiLogic(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultBadge(
                    bmiResult: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterPretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
