// import 'dart:ffi';
// import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
QuizBrain quizBrain=QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  // const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper=[];
  void checkAnswer(bool userPickedAnswer){
    bool correctAns=quizBrain.getQuestionAnswer();
    setState(() {
      print(quizBrain.isFinished());
      if(quizBrain.isFinished()==true){
        Alert(context: context, title: "Finished", desc: "You've reached the end of the quiz.").show();
        quizBrain.resetIt();
        scoreKeeper=[];
      }else{
    if (userPickedAnswer==correctAns){
      print('user got it right');
      scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ));
    } else {
      print('user got it wrong');
      scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ));
    }

      // scoreKeeper.add(
      //     Icon(
      //       Icons.close,
      //       color: Colors.red,
      //     ));
      // quesNum += 1;
      quizBrain.nextQuestion();
      }
    });
  }
  // List<String> questions=[
  //   'Django is a high-level Python web framework',
  //   'Django supports the MVC pattern',
  //   'MVC pattern is based on three components',
  //   'urls.py is used If you need to deploy your project over WSGI',
  //   'In Django, views have to be created in the app views.py file',
  //   'A variable in django looks like this: [{variable}]'
  // ];
  // List<bool> answer=[
  //   true,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  // ];
  // Question q1=Question(q, a)

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex:6,
            child:Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )
        ),
        Expanded(child: Padding(
            padding: const EdgeInsets.all(15.0),
          child:TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: (){
              checkAnswer(true);

            },
              child: const Text("True",textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),)
          )
        ),
        ),
        Expanded(child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red,),
              onPressed: (){
                checkAnswer(false);
              },
              child: const Text("False",textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),),
            )
        ),
        ),
        Row(
          children:scoreKeeper,
        )
      //TODO: Add a score here as your score keeper
      ],
    );
  }
}



