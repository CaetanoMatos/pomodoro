import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Pomodoro(),

  ));
}
class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {

  double percent = 0; //define que começa sempre a partir do 0

  static int TimeMinuto = 25;
  int TimeSegundo = TimeMinuto * 60;

  late Timer timer; //cria o objeto timer


  _StarCont(){
    TimeMinuto = 25;
    int Time = TimeMinuto * 60;
    double SecPercent = (Time/100);
    timer= Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(Time>0){
          Time--;
          if(Time % 60 == 0){
            TimeMinuto --;

          }if(TimeSegundo % SecPercent ==0){
          if(percent<1){
            percent+=0.01;
          }else{
            percent = 1;
          }
          }
        }else{
          percent=0;
          TimeMinuto = 25;
          timer.cancel();
        }
      });
    });

  } //função que conta

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff8d8e8f), Color(0xff67a5b2), Color(0xff4dcee5)],
                  begin:FractionalOffset(0.5,1)
              )
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  'Relógio Pomodoro',
                  style: TextStyle(
                    fontFamily: AutofillHints.addressCityAndState,
                      color: Colors.white,
                      fontSize: 34.0
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  'Desenvolvido por Caetano',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),

              Expanded( //aqui vamos criar nossa barra de progesso
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round, //fica com desing da barra de progresso mais bonitinho
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 100.0,
                  lineWidth: 20.0,
                    progressColor: Colors.white,
                  center: Text(
                    "$TimeMinuto",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),



                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                          topRight:  Radius.circular(30.0), topLeft: Radius.circular(30.0)
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0,right: 20.0, left: 20.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(child: Row(
                            children: <Widget>[

                              Expanded(child: Column(
                                children: <Widget>[
                                  Text(
                                    'Minutagem de Estudo:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text(
                                    '25 ',
                                    style: TextStyle(
                                        fontSize: 60.0
                                    ),
                                  ),
                                ],
                              ),
                              ),
                              Expanded(child: Column(
                                children: <Widget>[
                                  Text(
                                    'Minutagem de Pausa:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text(
                                    '5 ',
                                    style: TextStyle(
                                        fontSize: 60.0
                                    ),
                                  ),
                                ],
                              ),
                              ),
                            ],
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: ElevatedButton(
                              onPressed: _StarCont,
                              child: Text("Começar"),
                            ),
                          )



                        ],
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




