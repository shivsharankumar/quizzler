import 'question.dart';
class QuizBrain{
  int _quesNum=0;

  final List<Question> _questionBank=[
    Question('Django is a high-level Python web framework', true),
    Question('Django supports the MVC pattern', true),
    Question('MVC pattern is based on three components', true),
    Question('urls.py is used If you need to deploy your project over WSGI', false),
    Question('In Django, views have to be created in the app views.py file', true),
    Question('A variable in django looks like this: [{variable}]', false),

  ];
  void resetIt(){
    _quesNum=0;
  }
  void nextQuestion(){
    if(_quesNum<_questionBank.length-1){
      _quesNum++;
    }
    // print(_quesNum.bitLength);
    // print(_quesNum);
  }
  String getQuestionText(){
    return _questionBank[_quesNum].quesText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_quesNum].quesAns;
  }
  bool isFinished(){
    if(_quesNum>=_questionBank.length-1){
      return true;
    }
    else{
      return false;
    }

    // return _questionBank[_quesNum].quesAns;
  }
}