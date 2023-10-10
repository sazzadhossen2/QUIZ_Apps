import 'package:demo/question.dart';

class Questionvalue{
  int  _questionNumber=0;
  List<Question> _questionset=[
    Question(ques: "i  am so happy.State a new journey", imag:"assets/images/5093.webp", ans:true),
    Question(ques:"now My location Daffodial" , imag: "assets/images/Screenshot_21.png", ans: true),
    Question(ques: " Twteer CEO ME", imag: "assets/images/Twitter_2012_logo.svg.png" , ans: false),
    Question(ques: "istagram is dopamine.", imag:"assets/images/HOW-TO-PUBLISH-ON-INSTAGRAM.jpg", ans:true),
    Question(ques:"Face book CEO elonmusk" , imag: "assets/images/Download-Facebook-data.jpg", ans: false),
    Question(ques: " Google is giant company", imag: "assets/images/Google__G__Logo.svg.webp" , ans: true),
    Question(ques:"sum = 25+44=79" , imag: "assets/images/png-clipart-free-math-thumbnail.png", ans: false),
    Question(ques: " 22+43.8+7.2+43=135", imag: "assets/images/download.jpeg" , ans: false),
    Question(ques: " ami daffodial er murgi", imag: "assets/images/download (1).jpeg" , ans: true),
    Question(ques: " Thnakyou your long Journey", imag: "assets/images/s960_thank_you_sticky_note.jpg" , ans: false),

  ];
  void nextquestion() {
    if (_questionNumber <= _questionset.length-1) {
      _questionNumber++;
    }
  }
  String getQuestiontitle(){
    return _questionset[_questionNumber].question;
  }
  String getImage (){
    return _questionset[_questionNumber].images;
  }
  bool getAns(){
    return _questionset[_questionNumber].answer;
  }
  bool isFinished(){
    if(_questionNumber>=_questionset.length-1){
      return true;
    }else{
      return false;
    }
  }
  void reset(){
    _questionNumber=0;
  }
}