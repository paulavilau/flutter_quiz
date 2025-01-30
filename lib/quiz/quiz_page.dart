import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  bool isLoading = true;
  int correctAnswers = 0;
  int quizLength = 0;

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  Future<void> _initializeQuiz() async {
    await quizBrain.fetchQuestions();
    setState(() {
      quizLength = quizBrain.getQuizLength();
      isLoading = false;
    });
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        correctAnswers++;
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'Congrats! You finished the quiz. You got $correctAnswers/$quizLength correct answers.',
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
        correctAnswers = 0;
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.blue.shade100,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.3,
              image: AssetImage('images/back.jpg'),
              fit: BoxFit
                  .cover, // Ensures the image covers the entire background
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontFamily: "Roboto Slab",
                        fontWeight: FontWeight.bold,
                        fontSize: 29.0,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              color: Colors.blueGrey,
                              offset: Offset.zero,
                              blurRadius: 30)
                        ],
                      ),
                      child: Text(
                        quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      shadowColor: WidgetStatePropertyAll(Colors.black),
                      elevation: WidgetStatePropertyAll(9),
                    ),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        fontFamily: "Roboto Slab",
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                      checkAnswer(true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.red.shade700),
                      shadowColor: const WidgetStatePropertyAll(Colors.black),
                      elevation: const WidgetStatePropertyAll(9),
                    ),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontFamily: "Roboto Slab",
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Row(
                  children: scoreKeeper,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
