import 'package:flutter/material.dart';
import 'package:night_gschallenge/navigators/bottomNavigator.dart';
import 'package:night_gschallenge/screens/menu/TestMyBedroom/test_my_bedroom.dart';
import 'package:night_gschallenge/widgets/menu/text_to_speech.dart';
import './menu.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';


  List<Map<String,String>>items =[
    {'text':'Test My Bedroom','imagePath':'images/test_my_environment.png','routes':TestMyBedroom.routeName},
    {'text':'Phone-Free time','imagePath':'images/phone_free.png'},
    {'text':'Meditation Timer','imagePath':'images/meditation_timer.png'},
    {'text':'Listen to your stories','imagePath':'images/nap_timer.png','routes':TextToSpeechComponent.routeName},
    {'text':'Sleep Cycle Calculator','imagePath':'images/sleep_cycle_calculator.png'},
    {'text':'Sleep Diet Suggestions','imagePath':'images/sleep_diet.png'},
    {'text':'Mental Exercises','imagePath':'images/mental_exercises.png'},
    {'text':'Sleep Achievement','imagePath':'images/sleep_achievement.png'},
    {'text':'Music Therapy','imagePath':'images/podcasts_stories.png'},
    {'text':'Worry List','imagePath':'images/worry_list.png'},
  ];
  @override

  void navigate(BuildContext context,int index){
    Navigator.of(context).pushNamed(items[index]['routes'].toString());
  }
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2 / 2,crossAxisSpacing: 20,mainAxisSpacing: 20), itemBuilder: (context, index) {
        return GestureDetector(child: Menu(text: items[index]['text'].toString(), imagePath: items[index]['imagePath'].toString()),onTap: ()=> navigate(context,index),);
      },itemCount: items.length, ),
    );
  }
}
