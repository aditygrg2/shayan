import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/worry_list_provider.dart';
import 'package:night_gschallenge/screens/menu/WorryList/resolution_card_with_comment.dart';
import 'package:night_gschallenge/widgets/UI/loadingStateCreator.dart';
import 'package:provider/provider.dart';

class ResolutionCards extends StatefulWidget {
  @override
  State<ResolutionCards> createState() => _ResolutionCardsState();
}

class _ResolutionCardsState extends State<ResolutionCards> {
  @override
  Widget build(BuildContext context) {
    var worryProvider = Provider.of<WorryListProvider>(context);
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: LoadingStateCreator(),
                );
              }
              final doc = snapshot.data as QuerySnapshot;
              return Column(
                children: [
                  ...doc.docs.map((e) {
                    return ResolutionCardWithComment(e.id,e['worry'],e['situation'],e['notes']);
                  })
                ],
              );
            },
            future: worryProvider.getWorry(),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
