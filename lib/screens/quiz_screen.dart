import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen.dart';

import '../models/ques.dart';
import '../widgets/answer_card.dart';
import '../widgets/next_button.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnsIndex;
  int queIndex=0;
  int score=0;
  void pickAnswer(int value){
    selectedAnsIndex=value;
    final question=questions[queIndex];
    if(selectedAnsIndex== question.crctAnswerIndex){
      score++;
    }
    setState(() {

    });
  }
  void goToNextQue(){
    if(queIndex<questions.length-1){
      queIndex++;
      selectedAnsIndex=null;
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final question=questions[queIndex];
    bool isLastQue=queIndex==questions.length-1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(question.question,
            style: const TextStyle(
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: selectedAnsIndex==null?()=>pickAnswer(index):null,
                  child: AnswerCard(
                    currentIndex:index,
                    question:question.options[index],
                    isSelected:selectedAnsIndex==index,
                    selectedAnsIndex:selectedAnsIndex,
                    crctAnswerIndex:question.crctAnswerIndex,
                  ),
                );
              },
            ),
            isLastQue?  RectangularButton(
          onPressed: () {
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(
    builder: (_) => ResultScreen(
    score: score,
    ),
    ),
    );
    },
      label: 'Finish',
    )
        : RectangularButton(
    onPressed:
    selectedAnsIndex != null ? goToNextQue : null,
    label: 'Next',
    ),
          ],
        ),
      ),
    );
  }
}
