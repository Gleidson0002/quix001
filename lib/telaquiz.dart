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
  Map<String, Color> buttonColors = {};
  bool isAswered = false;
  final int duracao = 10;
 final CountDownController controle = CountDownController();


  List<Question> questions = [

    Question('Qual é a capital da Austrália?', 'Canberra', 'lib/assets/image/australia.png',
    ['Sydney','Melbourne','Canberra'],),

    Question('Qual o maior deserto do mundo?', 'Deserto da Antártica','lib/assets/image/piramide1.png',
    ['Deserto da Arábia','Deserto da Antártica','Deserto do Saara']),

    Question('Em qual continente fica o Monte Kilimanjaro?', 'África','lib/assets/image/globe.png',
    ['Ásia','América do Sul','África']),

    Question('Qual é o rio mais longo do mundo?', 'Rio Amazonas', 'lib/assets/image/rio1.png',
   ['Rio Amazonas','Rio Yangtzé','Rio Nilo'] ),
    //
    Question('Qual é o país mais populoso da Europa?', 'Rússia', 'lib/assets/image/population.png',
   ['Alemanha','Rússia','Inglaterra'] ),
    
    Question('Qual é o nome do maior oceano da Terra?', 'Oceano Pacífico', 'lib/assets/image/tuba.png',
   ['Oceano Indico','Oceano Pacífico','Oceano Atlântico'] ),
    
    Question('Qual país tem a maior extensão litoral do mundo?', 'Canadá', 'lib/assets/image/ilha.png',
   ['Canadá','Brasil','Rússia'] ),

    Question('Qual é a capital do Canadá?', 'Ottawa', 'lib/assets/image/canada.png',
   ['Toronto','Vancouver','Ottawa'] ),

    Question('Qual a ilha mais famosa do Japão?', 'Honshu (本州)', 'lib/assets/image/Japao.png',
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
       buttonColors[userAnswer] = Colors.green;
      }else {
        buttonColors[userAnswer] = Colors.red;
        buttonColors[answer] = Colors.green;
      }
        });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        buttonColors = {};
         controle.restart();
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
      if(isAswered) return;
      questionIndex = 0;
      score = 0;
      coutindex = 1;
      buttonColors = {};
      isAswered = false;
     controle.restart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
               Text('Perguntas: $coutindex / ${questions.length}',style: TextStyle(fontSize: 25.0, color: Colors.white),),
                      
            const Spacer(),
            CircularCountDownTimer(
              duration: duracao,
              initialDuration: 0,
              controller: controle,
              width: 45,
              height: 45,
              ringColor: Colors.black,
              fillColor: Color.fromARGB(255, 34, 41, 145),
              backgroundColor: Colors.transparent,
              strokeWidth: 10.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {},
              onComplete: () {
                if (questionIndex < questions.length - 1) {
                  setState(() {
                    questionIndex++;
                       coutindex++;
                  }); 
                  controle.restart();
                } else {
                 
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaResultado(score, questions.length, resetquiz)));
                }
              },
              onChange:(String timeStamp) {},
            ),     
            ]
          ) 
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
                    opcao,
                     style: TextStyle(fontSize: 25.0, color: buttonColors[opcao] ?? Color.fromARGB(255, 255, 255, 255),),
                  ), style: ElevatedButton.styleFrom( backgroundColor: Color.fromARGB(166, 42, 11, 216)),
                    );
              }).toList(),                
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
