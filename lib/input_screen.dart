import 'package:flutter/material.dart';
import 'package:new_bmi_for_module/custom_card.dart';
import 'package:new_bmi_for_module/custom_slider.dart';
import 'package:new_bmi_for_module/result_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender;
  int height = 128;
  int weight = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: CustomCard(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Gender',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: Card(
                        child: Text(
                          'Male',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        color: selectedGender == Gender.male
                            ? Colors.yellow[900]
                            : Colors.grey[700]),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Card(
                        child: Text(
                          'Female',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        color: selectedGender == Gender.female
                            ? Colors.yellow[900]
                            : Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Height',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$height cm',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        CustomSlider(
                          min: 100,
                          max: 230,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Weight',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$weight kg',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        CustomSlider(
                          min: 30,
                          max: 180,
                          value: weight.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              weight = value.round();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) =>
                      ResultScreen(selectedGender, height, weight),
                );
              },
              color: Colors.yellow[900],
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Gender { male, female }
