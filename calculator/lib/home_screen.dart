import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInp = '';
  var ans = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userInp,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      ans,
                      style: TextStyle(color: Colors.grey, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          col: Colors.grey,
                          onPress: () {
                            userInp = '';
                            ans = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          col: Colors.grey,
                          onPress: () {},
                        ),
                        MyButton(
                          title: '%',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '%';

                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          col: Colors.orange,
                          onPress: () {
                            setState(() {});
                            userInp += '/';
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '0',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x',
                          col: Colors.orange,
                          onPress: () {
                            userInp += 'x';
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '–',
                          col: Colors.orange,
                          onPress: () {
                            userInp += '-';
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          col: Colors.orange,
                          onPress: () {
                            userInp += '+';
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          col: Colors.grey,
                          onPress: () {
                            userInp += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          col: Colors.grey,
                          onPress: () {
                            userInp = userInp.substring(0, userInp.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          col: Colors.orange,
                          onPress: () {
                            equal();
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equal() {
    final finaluserInput = userInp.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    ans = eval.toString();
  }
}
