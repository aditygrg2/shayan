import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/watch_provider.dart';

class PlanScreen extends StatefulWidget {
  static const routeName = '/plan';

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  
  @override
  Widget build(BuildContext context){
        return Container(child: Text('my plan screen'),);
  }
}