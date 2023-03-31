import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class DialogflowProvider extends ChangeNotifier {
  
  Future<DetectIntentResponse?> setFlow(String text) async {
    DialogAuthCredentials credentials = await DialogAuthCredentials.fromFile('assets/secretkey.json');
    DialogFlowtter instance = DialogFlowtter(
      credentials: credentials,
    );

    final DialogFlowtter dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: DateTime.now().toString(),
    );

    final QueryInput queryInput = QueryInput(
      text: TextInput(
        text: text,
        languageCode: "en",
      ),
    );

    return dialogFlowtter.detectIntent(
      queryInput: queryInput,
    );
  }
}
