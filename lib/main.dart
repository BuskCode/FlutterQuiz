import 'package:first_app/answer.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './question.dart';

void main() {
  runApp(MyApp()); //Køre appen
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //Egen Widget klasse, hvor StatelessWidget giver nogle ekstra funktioner
  var _questionIndex = 0;

  final questions = const [
    {
      "questionText": "What's is your favorite color?",
      "answers": ["Black", "Red", "Green", "White"],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Lion", "Snake", "Bull", "Tiger"],
    },
    {
      "questionText": "Who's your favorite superhero?",
      "answers": ["Batman", "Superman", "The Flash", "Dr. Strange"],
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print("We have more questions");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(
      BuildContext
          context) /*Objekt type, som giver af FLutter fra "/material.dart"*/ {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Quiz App"),
        ),
        body:_questionIndex < questions.length ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ) : Center(child: Text("You did it"),),
      ),
    );
  }
}
