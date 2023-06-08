import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'mainScreen.dart';


class OneBoardingScreen extends StatefulWidget {
  const OneBoardingScreen({key}) : super(key: key);
  static const String id = 'onboard-screen';

  @override
  _OneBoardingScreenState createState() => _OneBoardingScreenState();
}

class _OneBoardingScreenState extends State<OneBoardingScreen> {
  double scrollerPosition = 0;
  final store = GetStorage();


  onebuttonPressed(context){
    store.write('OnBoarding', true);
    return  Navigator.pushReplacementNamed(context, MainScreen.id);
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ]
    );
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (val){
              setState(() {
                scrollerPosition = val.toDouble();
              });
            },
            children: [
              OneBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Bienvenu  \n sur FritIch', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text('Manger Aisement   ', textAlign: TextAlign.center, style: new TextStyle(color: Colors.yellowAccent, fontSize: 28, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/images/1.jpg')),

                  ],
                ),
              ),
              OneBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('7 - 14 jours pour retourner', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text(' Satisfaction Garrentie', textAlign: TextAlign.center, style: new TextStyle(color: Colors.yellowAccent, fontSize: 28, fontWeight: FontWeight.bold),),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/images/2.jpg')),

                  ],
                ),
              ),
              OneBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('paiement securisé ',textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text('Payer avec wave, Orange Money ou Moov Money',textAlign: TextAlign.center, style: new TextStyle(color: Colors.yellowAccent, fontSize: 28, fontWeight: FontWeight.bold),),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/images/3.jpg')),

                  ],
                ),
              ),
              OneBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('De Nouvelles Collection de Plats',textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text(' A moindre Cout ',textAlign: TextAlign.center, style: new TextStyle(color: Colors.yellowAccent, fontSize: 28, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/images/4.jpg')),

                  ],
                ),
              ),
              OneBoardPage (
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Livraison Rapide dans Tous Abidjan',textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                    Text('Possibilité de choisir un livreur ',textAlign: TextAlign.center, style: new TextStyle(color: Colors.yellowAccent, fontSize: 28, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset('assets/images/5.jpg')),

                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 5,
                  position: scrollerPosition,
                  decorator: const DotsDecorator(color: Colors.white, activeColor: Colors.yellowAccent),

                ),
                scrollerPosition == 4 ? Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                    ),

                    onPressed: (){
                      onebuttonPressed(context);
                    },
                    child: Text('Commencer Achat'),
                  ),
                ) :
                TextButton(
                  child: Text("Passer cette Etape >", style: TextStyle(fontSize: 20, color: Colors.white),),
                  onPressed: (){
                    onebuttonPressed(context);

                  },
                ),
                SizedBox(height: 50,),
              ],
            ),
          )
        ],

      ),
    );
  }
}


class OneBoardPage extends StatelessWidget {

  final Column boardColumn;
  OneBoardPage({key, this.boardColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepOrange,
          child: Center(child: boardColumn,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xFF28759E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80),
                  topLeft: Radius.circular(80),
                )
            ),
          ),
        )
      ],

    );
  }
}
