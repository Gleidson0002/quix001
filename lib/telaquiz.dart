import 'package:flutter/material.dart';
import 'tela_result.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  int questionIndex = 0;
  int score = 0;
  int coutindex = 1;
  Color textColor = Colors.white;
  bool isAswered = false;

  List<Question> questions = [

    Question('Qual é a capital da Austrália?', 'Canberra', 'lib/assets/image/australia.png',
    ['Sydney','Melbourne','Canberra'],),

    Question('Qual o maior deserto do mundo?', 'Deserto da Antártica','lib/assets/image/piramide1.png',
    ['Deserto da Arábia','Deserto da Antártica','Deserto do Saara']),

    Question('Em qual continente fica o Monte Kilimanjaro?', 'África','lib/assets/image/globe.png',
    ['Ásia','América do Sul','África']),

    Question('Qual é o rio mais longo do mundo?', 'Rio Nilo', 'lib/assets/image/rio1.png',
   ['Rio Amazonas','Rio Yangtzé','Rio Nilo'] ),
    //
    Question('Qual é o país mais populoso do mundo?', 'China', 'lib/assets/image/population.png',
   ['China','India','Estados Unidos'] ),
    
    Question('Qual é o nome do maior oceano da Terra?', 'Oceano Pacífico', 'lib/assets/image/tuba.png',
   ['Oceano Indico','Oceano Pacífico','Oceano Atlantico'] ),
    
    Question('Qual país tem mais ilhas no mundo?', 'Suécia', 'lib/assets/image/ilha.png',
   ['Suécia','Filipinas','Noruega'] ),

    Question('Qual é a capital do Canadá?', 'Ottawa', 'lib/assets/image/canada.png',
   ['Toronto','Vancouver','Ottawa'] ),

    Question('Qual a ilha mais famosa do Japão?', 'Honshu (本州)', 'lib/assets/image/japao.png',
   ['Kyushu (九州)','Hokkaido (北海道)','Honshu (本州)'] ),

    Question('Qual foi o maior imperio do mundo?', 'Império Mongol', 'lib/assets/image/napoleao.png',
   ['Império Romano','Império Mongol','Império Chines'] ),

  ];

  void checkAnswer(String userAnswer) {
    String answer = questions[questionIndex].answer;
    if(isAswered) return;
  
    setState(() {
      isAswered = true;
      if (userAnswer == answer) {
        score+=10;
        textColor = Colors.green;
      }else {
        textColor = Colors.red;
      }
        });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        textColor = Colors.white;
         if (questionIndex < questions.length - 1) {
        questionIndex++;
        coutindex++;
      } else {
        Navigator.push(
         context, 
           MaterialPageRoute(builder: (context) => TelaResultado(score, questions.length,resetquiz)),

        ); 
     }
     isAswered = false;
      });
   });
  }

  void resetquiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      coutindex = 1;
      textColor = Colors.white;
      isAswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
            const Spacer(),
            Expanded(
              flex: 7,
              child: Image.asset(
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
                  child: Text(
                    opcao, style: TextStyle(fontSize: 25.0,color: textColor),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(166, 42, 11, 216)),  
                );
              }
            ).toList(),         
         ),
           Container(
             padding: EdgeInsets.all(20.0),
             child: ElevatedButton(
              child: Text('Resetar', style: TextStyle(fontSize: 20.0,color: Colors.white),),
              onPressed: () =>resetquiz(),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(166, 42, 11, 216)),
            )
           ),           
          ],
        )
      ),
    );
  }
}

class Question {
  final String questionText;
  final String answer;
  final String AssetImage;
  final List<String> opcao;

  Question(this.questionText, this.answer, this.AssetImage,this.opcao);
}
