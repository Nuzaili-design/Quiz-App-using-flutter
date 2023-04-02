import 'package:flutter/material.dart';
import 'package:quiz_app/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

 List<Question> questionList = getQuestions();
 int currentQuestionIndex = 0;
 int score = 0;
 Answer? selectedAnswer;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body:Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,

            children:  [
            Text(
              "Quiz 1",
              style: TextStyle(
                color: Colors.white,
                fontSize:25,
              ),
            ),
        _questionWidget(),
            _answerList(),
           _nextButton(),
        ]),
      ),

    );
  }
  _questionWidget(){
return Column(
 crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,

  children: [
    Text("Question ${currentQuestionIndex + 1}/${questionList.length.toString()} ",

      style: TextStyle(
   color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,

),
    ),
    const SizedBox(height: 20,),
    Container(
      alignment: Alignment.center,
     width: double.infinity,
     padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(16)
    ),
   child:  Text(
     questionList[currentQuestionIndex].questionText,
     style: const TextStyle(
       color: Colors.white,
       fontSize: 18,
       fontWeight: FontWeight.w600,
     ),
   ),

    ),
],
    );
  }
_answerList(){
    return Column(
      children:questionList [currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
   .toList(),
    );
  }

    Widget _answerButton(Answer answer){
   bool isSelected = answer==selectedAnswer;


    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, shape: const StadiumBorder(), backgroundColor: isSelected?Colors.brown:Colors.white,
      ),
        onPressed: () {
          if(selectedAnswer==null){
            if(answer.isCorrect){
              score++;
            }
            setState(() {
              selectedAnswer=answer;
            });
          }

        },
      ),
    );
  }

_nextButton(){


    bool isLastQuestion = false;
if(currentQuestionIndex==questionList.length-1){
  isLastQuestion=true;
}
  return Container(


    width: MediaQuery.of(context).size.width * 0.5,
    height: 48,
    child: ElevatedButton(
      child: Text(isLastQuestion ?" Submit" : "Next"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, shape: const StadiumBorder(), backgroundColor: Colors.brown,
      ),
      onPressed: () {

        if(isLastQuestion){


          showDialog(context: context, builder: (_)=> _showScoreDialog());
        }else{
          setState(() {
            selectedAnswer=null;
            currentQuestionIndex++;
          });
        }

      },
    ),
  );
}
_showScoreDialog(){
  bool isPassed=false;

  if(score >= questionList.length * 0.6){
    isPassed = true;
  }
  String title = isPassed ? "Perfect!": "Failed!";
    return AlertDialog(
      title: Text(title + " your score is $score",
        style: TextStyle(
          color: isPassed?Colors.blue:Colors.redAccent,
      ),
      ),
  content: ElevatedButton(child: const Text("Restart the app"), onPressed: () {
    Navigator.pop(context);
   setState(() {
     currentQuestionIndex=0;
     score=0;
     selectedAnswer=null;
   });
  },
  ),
    );
}

}
