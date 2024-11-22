import 'package:bmi_calculater/screen/result_page.dart';
import '../common/bottom_button.dart';
import '../common/round_raw_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/container_card.dart';
import '../common/icon_card.dart';
import '../util/constants.dart';
import '../util/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inActiveColor;
  // Color femaleCardColor = inActiveColor;

  // void updateColor(int gender) {
  //   // for male = 1
  //   if (gender == 1) {
  //     if (maleCardColor == inActiveColor) {
  //       maleCardColor = activeColor;
  //       femaleCardColor = inActiveColor;
  //     } else {
  //       maleCardColor = inActiveColor;
  //     }
  //   }
  //   // for female = 2
  //   if (gender == 2) {
  //     if (femaleCardColor == inActiveColor) {
  //       femaleCardColor = activeColor;
  //       maleCardColor = inActiveColor;
  //     } else {
  //       femaleCardColor = inActiveColor;
  //     }
  //   }
  // }

  Gender? selectedGender;

  int height = 180;
  int weightNumber = 60;
  int ageNumber = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: const Center(
          child: Text(
            'Bmi Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Color(0xFF0A0E21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: (selectedGender != null &&
                            selectedGender! == Gender.male)
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: IconCard(
                      icon: Icons.male,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: (selectedGender != null &&
                            selectedGender! == Gender.female)
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: IconCard(
                      icon: Icons.female,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerCard(
              onPress: () {},
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xffEB1555),
                        overlayColor: Colors.pink.shade900),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // divisions: ,
                      // activeColor:
                      // inactiveColor: ,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    onPress: () {},
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kTextStyle),
                        Text('$weightNumber', style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // FloatingActionButton(
                            //   backgroundColor: kActiveColor,
                            //   shape: CircleBorder(),
                            //   child: Icon(Icons.remove),
                            //   onPressed: () {
                            //     setState(() {
                            //       weightNumber--;
                            //     });
                            //   },
                            // ),
                            RoundRawButton(
                              icon: Icon(Icons.remove),
                              press: () {
                                setState(() {
                                  weightNumber--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundRawButton(
                                icon: Icon(Icons.add),
                                press: () {
                                  setState(() {
                                    weightNumber++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    onPress: () {},
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kTextStyle),
                        Text('$ageNumber', style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundRawButton(
                                icon: Icon(Icons.remove),
                                press: () {
                                  setState(() {
                                    ageNumber--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundRawButton(
                                icon: Icon(Icons.add),
                                press: () {
                                  setState(() {
                                    ageNumber++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              bottomText: 'CALCUTATE',
              onTap: () {
                CalculatorBrain calB =
                    CalculatorBrain(weight: weightNumber, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      resultBmi: calB.calculateBmi(),
                      resultText: calB.getResult(),
                      getInterPretation: calB.getInterPretation(),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
