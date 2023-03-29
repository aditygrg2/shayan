import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:night_gschallenge/providers/timeline_provider.dart';
import 'package:night_gschallenge/screens/plan/addEdit_timeline.dart';
import 'package:night_gschallenge/screens/plan/timeline_card.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:provider/provider.dart';
import '../../widgets/UI/home_screen_heading.dart';

class PlanScreen extends StatefulWidget {
  static const routeName = '/plan';

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  bool showPlan = false;

  Duration isActiveCheck(String str) {
    var format = DateFormat("HH:mm");
    var first = format.parse(str);
    var now = DateTime.now();
    var second = format.parse("${now.hour}:${now.minute}");
    return first.difference(second);
  }

  @override
  Widget build(BuildContext context) {
    var timelineProvider = Provider.of<TimelineProvider>(context);
    var timeline = timelineProvider.getTimeline;
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          HomeScreenText(
            text: "My Plan",
          ),
          Container(
            width: 180,
            height: 180,
            child: Image.asset(
              "assets/my_plan.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              'Our smart mix to shape your plan',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          !showPlan
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "we’ll support you on your way to more restful,natural sleep,which will lead you to be more energetic and alert. Follow your dynamic timeline schedule for step-by-step guidance.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: Text(
                        "We promise to ease the change and support you with all we can",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: GridView(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        shrinkWrap: true,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.timeline_rounded,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "Personalized dynamic timeline",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(Icons.youtube_searched_for,
                                    color: Colors.black, size: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "enriching sleep education content",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(Icons.chat_rounded,
                                    color: Colors.black, size: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "chat with a sleep trainer",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(Icons.timer_outlined,
                                    color: Colors.black, size: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  "rightly timed reminders",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButtonWithoutIcon(
                          onPressedButton: () {
                            setState(() {
                              showPlan = !showPlan;
                            });
                          },
                          text: "I'm ready"),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                          showModalBottomSheet(context: context, builder: (context){
                            return  SingleChildScrollView(child: AddEditTimeline(-1));
                          
                          },backgroundColor: Colors.white);
                        }, icon: Icon(Icons.add,color: Colors.black,size: 34,))
                      ],
                    ),
                    ...(timeline
                        .map((e) {
                          var difference = isActiveCheck(e['time']);
                          int index = timeline.indexOf(e);
                          if (difference.compareTo(Duration.zero) >= 0)
                            return TimelineCard(
                              index: index,
                              duration: difference.toString(),
                              isActive:
                                  difference.compareTo(Duration.zero) == 0,
                              task: e['task'],
                              time: e['time'],
                            );
                          else
                            return null;
                        })
                        .toList()
                        .where((element) => element != null)
                        .toList() as List<Widget>),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "There's more in the Store",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Share your sleep experience, daily habits and overall lifestyle patterns. we’ll match you up with training items which specifically suit your needs",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: ElevatedButtonWithoutIcon(
                          onPressedButton: () {
                            setState(() {
                              showPlan = !showPlan;
                            });
                          },
                          text: "get your Plan"),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
