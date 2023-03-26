import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:night_gschallenge/providers/count_down_provider.dart';
import 'package:provider/provider.dart';

class ZenScreen extends StatefulWidget {

  static String routeName ='/zen-screen';

  @override
  State<ZenScreen> createState() => _ZenScreenState();
}

class _ZenScreenState extends State<ZenScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    var controller = Provider.of<CountDownProvider>(context).controller;
    return WillPopScope(
      onWillPop: ()async {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('You are in Zen Mode Wait for '),Expanded(child: ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Exit Mode',),)),],) ));
        return false;
      },
      child: Scaffold(
        body: Center(
          child: NeonCircularTimer(
            onComplete: (){
              Navigator.of(context).pop();
            },
            controller: controller,
            textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 37,color: Colors.white),
            isTimerTextShown: true,
            neumorphicEffect: true,
            duration: (args as int)*60,
            innerFillGradient: LinearGradient(colors: [
            Colors.greenAccent.shade200,
            Colors.blueAccent.shade400
          ]),
          backgroudColor: Colors.black,
          neonGradient: LinearGradient(colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(143, 227, 221, 1)
          ]),
            width: 250,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}