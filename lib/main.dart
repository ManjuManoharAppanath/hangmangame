import 'package:flutter/material.dart';
import 'package:hangmangame/colors.dart';
import 'package:hangmangame/game.dart';
import 'package:hangmangame/letter.dart';

import 'figure_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp(),);
  }
}
class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word="flutter".toUpperCase();
  List alphabets=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','U','V','W',
    'X','Y','Z'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.PrimaryColor,
    appBar: AppBar(
      title: Text("Hangman"),
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColor.PrimaryColor,
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(children: [
              figureImage(Game.tries>=0,"img/hang.jpg"),
              figureImage(Game.tries>=1,"img/head.jpg"),
              figureImage(Game.tries>=2,"img/body.jpg"),
              figureImage(Game.tries>=3,"img/ra.jpg"),
              figureImage(Game.tries>=4,"img/la.jpg"),
              figureImage(Game.tries>=5,"img/rl.jpg"),
              figureImage(Game.tries>=6,"img/ll.jpg"),
            ],),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
              word.split('').map((e)=>letter(e.toUpperCase(),
                  !Game.SelectedChar.contains(e.toUpperCase()))).toList(),
            ),

          SizedBox(width: double.infinity,
          height: 250,
          child: GridView.count(crossAxisCount: 7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(8),
          children: alphabets.map((e){
            return RawMaterialButton(onPressed:
                Game.SelectedChar.contains(e)?null:(){
              setState(() {
                Game.SelectedChar.add(e);
                print(Game.SelectedChar);
                if(!word.split("").contains(e.toUpperCase())){
                  Game.tries++;
                }
              });
                },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),
            ),
              child: Text(e,style: TextStyle(color: Colors.white,
              fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              fillColor: Game.SelectedChar.contains(e)?
              Colors.black87
                  :Colors.blue,
            );
          }).toList(),),
          ),
        ],
      ),
    );
  }
}
