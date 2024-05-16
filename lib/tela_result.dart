import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalperguntas;
  final Function resetquiz;

  TelaResultado(this.pontuacao, this.totalperguntas,this.resetquiz);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tela de Resultado', 
        style: TextStyle(fontSize: 24.0, color: Colors.white), ),
        backgroundColor: const Color.fromARGB(255, 36, 37, 43),
         automaticallyImplyLeading: false,
          centerTitle: true,),
        backgroundColor: const Color.fromARGB(255, 36, 37, 43),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image:NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/640px-Flag_of_the_People%27s_Republic_of_China.svg.png',
                
                ),
              ),
              Text(
                'Você completou o quiz!',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Text(
                'Pontos: $pontuacao de $totalperguntas',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 73, 66, 66),),
                  onPressed: () { 
                    resetquiz();
                    Navigator.pop(context);
                   Navigator.push(context, 
              MaterialPageRoute(builder: (context) => TelaInicial())
              );

                  },
                  child: Text('Voltar',style: TextStyle(fontSize: 24.0,color: Colors.white),)),
            ],
          ),
        ));
  }
}

