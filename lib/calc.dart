import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BMI/brain.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  final _formKey = GlobalKey<FormState>();

  final weight = TextEditingController();
  final height = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weight.dispose();
    height.dispose();
    super.dispose();
  }

  var bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 237, 255, 5),
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Enter Weight in Kg:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 50),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      //FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(RegExp('[0-9.]+')),
                    ],
                    controller: weight,
                  ),
                ),
                Text(
                  'Enter Height in cm:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 80),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      //FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(RegExp('[0-9.]+')),
                    ],
                    controller: height,
                  ),
                ),
                Container(
                  width: 200,
                  height: 60,
                  child: RaisedButton.icon(
                    color: Color.fromRGBO(255, 217, 255, 1),
                    elevation: 10,
                    onPressed: () {
                      CalculatorBrain calc = CalculatorBrain(
                          height: double.parse(height.text),
                          weight: double.parse(weight.text));
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color.fromRGBO(255, 237, 255, 5),
                              title: Container(
                                child: Text(
                                  calc.calculateBMI(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    //color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                      calc.getResult(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(calc.getInterpretation()),
                                  ],
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.calculate),
                    label: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
