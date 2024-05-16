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
            image: NetworkImage(
              'https://i.kym-cdn.com/photos/images/newsfeed/002/674/141/5ca.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),   
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(350.0),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.all(
                    16.0), // Adiciona um espaçamento ao redor do botão
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 73, 66, 66),
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
    );
  }
}
