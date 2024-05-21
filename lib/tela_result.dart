import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalperguntas;
  final Function resetquiz;

  TelaResultado(this.pontuacao, this.totalperguntas,this.resetquiz);

  @override
  Widget build(BuildContext context) {

  String getImageAsset(){
 if (pontuacao <= 30 ){
   return 'lib/assets/image/sabep.png';
 }
 if (pontuacao > 30 && pontuacao < 60){
  return 'lib/assets/image/sabemm.png';
 }
  else{
  return 'lib/assets/image/sabem.png';
 }

  }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text('Tela de Resultado', 
        style: TextStyle(fontSize: 24.0, color: Colors.white), ),
        backgroundColor:  Colors.transparent,
         automaticallyImplyLeading: false,
          centerTitle: true,),
        body: Container(
        width: double.infinity,
        height: double.infinity,
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/assets/image/tela1.png',
            ),
            fit: BoxFit.cover,
          ),
        ),  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
                 Image.asset(
              getImageAsset(),
              width: 400,
              height: 400,
            ),
              
              Text(
                'Você completou o quiz!',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Text(
                'Pontos: $pontuacao de 100',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 25, 3, 75),),
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
        )
        );
  }
}

