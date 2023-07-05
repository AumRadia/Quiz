import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoretracker = [];
  int _questionindex = 0;
  int _totalscore = 0;
  bool answerwasselected = false;
  bool endofquiz = false;



  void questionanswered(bool answerscore) {
    setState(() {
      answerwasselected = true;

      if (answerscore) {
        _totalscore++;
      }
      _scoretracker.add(answerscore
          ? Icon(
              Icons.check_circle,
              color: Colors.lightGreenAccent,
            )
          : Icon(
              Icons.clear,
              color: Colors.red,
            ));

      if(_questionindex + 1 == _questions.length)
        {
          endofquiz==true;
        }
    });
  }

  void resetquiz(){
    List<Icon> _scoretracker = [];
    int _questionindex = 0;
    int _totalscore = 0;
    bool endofquiz = false;
  }

  void nextquestion(){
    setState(() {
      _questionindex++;
      answerwasselected=false;
      if(_questionindex + 1 == _questions.length)
        {
          resetquiz();
        }
    });
  }
  final _questions = const [
    {
      'question': 'Highest rated imdb movie ?',
      'answers': [
        {'answerText': 'The dark knight', 'score': false},
        {'answerText': 'The Godfather', 'score': false},
        {'answerText': 'The shawshank redemption', 'score': true},
      ],
    },
    {
      'question': 'First movie of Quentin Tarantino ?',
      'answers': [
        {'answerText': 'Resevoir Dogs', 'score': true},
        {'answerText': 'Pulp Fiction', 'score': false},
        {'answerText': 'Django Unchained', 'score': false},
      ],
    },
    {
      'question': 'Inception was released in... ?',
      'answers': [
        {'answerText': '2011', 'score': false},
        {'answerText': '2010', 'score': true},
        {'answerText': '2009', 'score': false},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz",
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 10,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(children: [
              if (_scoretracker.length == 0)
                SizedBox(
                  height: 25,
                ),
              if (_scoretracker.length > 0) ..._scoretracker
            ]),
            Container(
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  _questions[_questionindex]['question'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ...(_questions[_questionindex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'] as String,
                answerColor: answerwasselected == true
                    ? answer['score'] == true
                        ? Colors.green
                        : Colors.red
                    : Colors.transparent,
                answerTap: () {
                  if(answerwasselected==true)
                    return;
                  questionanswered(answer['score'] as bool);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40)),
                onPressed: () {
                  if(!answerwasselected)
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select any one option')));
                    return;
                nextquestion();
    },
                child:
                    Text(endofquiz == true ? 'restart quiz' : 'next question')),
            Container(
              padding: EdgeInsets.all(20),
              child: Text.new( style: TextStyle(color: Colors.pinkAccent );
                'Score:${_totalscore.toString()}/${_questions.length}',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
