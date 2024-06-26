import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'telaquiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'lib/assets/image/tela.png',
            ),
            fit: BoxFit.cover,
          ),
        ),  

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(
              'lib/assets/image/logoinc11.png',
              width: 450,
              height: 450,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.all(
                    16.0), // Adiciona um espaçamento ao redor do botão
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 3, 75),
                  ),
                  onPressed: () {
                     Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Quizpage()
               
              ),
              );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Iniciar Jogo',
                        style: TextStyle(fontSize: 37.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     
      floatingActionButton:  Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconButton(
                icon: Icon(Icons.info, size: 30.0, color: Colors.white),
                onPressed: () {
                  // Ação do botão ao ser pressionado
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Informações'),
                        content: Text('Autor: Gleidson Sergio\nEmail: sergiogleidson98@gmail.com'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK!'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
  
    );
  }
}