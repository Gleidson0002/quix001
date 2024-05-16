import 'package:flutter/material.dart';
import 'tela_result.dart';
class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  int questionIndex = 0;
  int score = 0;
  int coutindex = 1;

  List<Question> questions = [

    Question('Qual é a capital da Austrália?', 'Canberra', 'lib/assets/image/australia.png',
    ['Sydney','Melbourne','Canberra'],),
    Question('Você acredita na valorização da virtude sobre os prazeres sensoriais?', 'Não','https://tse2.mm.bing.net/th?id=OIP.p9yfhNkiINRPMY8enHasmAAAAA&pid=15.1',
    ['Sim','Não','talvez']),
    Question('Acredita que as emoções não devem ser controladas para alcançar a serenidade?', 'Não','https://www.dexerto.com/cdn-image/wp-content/uploads/2024/04/10/berserk-return-date.jpg?width=3840&quality=60&format=auto',
    ['Sim','Não','talvez']),
    Question('Você concorda em enfatizar a importância de viver de acordo com a razão e a virtude?', 'Sim', 'https://i.redd.it/lklft848moxa1.png',
   ['Sim','Não','talvez'] ),
  ];

  void checkAnswer(String userAnswer) {
  String answer = questions[questionIndex].answer;

    setState(() {
      if (userAnswer == answer) {
        score++;
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        coutindex++;
      }else {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => TelaResultado(score, questions.length,resetquiz)),

        ); 
     }
    }
   );
  }

  void resetquiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 3, 75),
          title: Text('Perguntas: $coutindex / ${questions.length}',style: TextStyle(fontSize: 25.0, color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        
        ),
         body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/image/tela1.png'),
            fit: BoxFit.cover,
          ),
        ),   
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Image.network(
              questions[questionIndex].AssetImage,
            ),
            ),
              Expanded(
                flex: 7,
                child: Center(
                  child: Text(
                  questions[questionIndex].questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                ),
              ),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 8.0,
              children: questions[questionIndex].opcao.map((opcao) {
                return ElevatedButton(
                  onPressed: () => checkAnswer(opcao),
                  child: Text(opcao, style: TextStyle(fontSize: 25.0,color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(166, 42, 11, 216)),
                 
                );
              }
              ).toList(),
              //
            ),
           Container(
             padding: EdgeInsets.all(20.0),
             child: ElevatedButton(
              child: Text('resetar', style: TextStyle(fontSize: 20.0,color: Colors.white),),
              onPressed: () =>resetquiz(),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(166, 42, 11, 216)),
            )
           ),
            
          ],
        )
        ),);
  }
}

class Question {
  final String questionText;
  final String answer;
  final String AssetImage;
  final List<String> opcao;

  Question(this.questionText, this.answer, this.AssetImage,this.opcao);
}
