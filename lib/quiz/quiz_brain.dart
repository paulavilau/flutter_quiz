import 'package:cloud_firestore/cloud_firestore.dart';
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [];

  Future<void> fetchQuestions() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('questions');

    QuerySnapshot querySnapshot = await collectionRef.get();

    final allData = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Question(
        data['text'],
        data['answer'],
      );
    }).toList();

    _questionBank = allData;
    print(allData);
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].text;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  int getQuizLength() {
    return _questionBank.length;
  }

  void reset() {
    _questionNumber = 0;
  }
}
