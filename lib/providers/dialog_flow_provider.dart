import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogflowProvider extends ChangeNotifier {
  DialogAuthCredentials credentials = DialogAuthCredentials.fromJson(const {
    "type": "service_account",
    "project_id": "planar-door-381921",
    "private_key_id": "c77ee0d2816f4e7aa7ceaa41f8c241b774350e33",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCsGQ0fw6KTes/a\nIINnMDyfpaNEQBeGasGBr4GkYnm4YI5WyBUR+YFvIDA0lxDa7AFOqdWER5tJ8Fk/\nlIpHx+bWTzcEVX6yHbI89LsBP7GMxgv9jFYiXsGO16KnX7soGakmPknc3EW7I/30\nPS6RinIs0t6zzi3Oh8W3rA6G/4as7obeEz1pm9UUmT02i+uLUbf0TLioBVTaI+Q8\nFdZHqfmpaFRggdS+smgrXLzrU7/tZD3cOS5AAqI3d3LF+YKqolX4tYLYunq3QMAa\n/8XtHqS+v5Ksz985kzKjtrCvrc6hiiLP+SoBTjnTfimj5aFzLFS9kWSxSRf+AW/w\nrqIRdcRVAgMBAAECggEAToTbfQuYSGt3G9FLwq+6aSh8di47zYM1qIK3xpV7bYj4\nSFXfbyUETfxEoinuccPN0OMh3MmC61gykBSohpmJE2xu8JZFSOTNpowOKkKyMkVF\nwTffMK1E6HQv7Od7j48topo2vwLs+bYxLtcfQR4Ge7b2DtlaAunlZqiktCkvfART\n5EwLYeCZjJl+A0eI9bd3Q+LQCYizDn3vK5gQrcNb6fKjJvi4LH+ylR4xlUzfJRQS\nphT/je83Rb0gEl4XApCjsaw6On+r7/AgAn/sR/EkCi82Mf/fOkDfqXpafGwlfBE8\nigVFUHj6MQtMX3h5dCpR4Asmwl3cTAWuQgvpj0QbvQKBgQDkUT7VapibboaUkI7Y\nOo4Q6BgVCYUt9STkd7wqkQl5dVqHDoSw6rykc0lLgbicUGRGG7Sed+E7tUygXuij\nXzPw1bvvKOsBoErIdEU8JhQeLmRSmdUgZ7WKld9freZ50QOyejZ8wbV24Zi1pRwj\nlue90CC890QkXrPQkiBScmlWfwKBgQDA9s46PmK3rG8M2Lp5Csc5DdCFRh8ggYTj\nWLh2WbmQNfvu4pHGwvvGKSI0rCJbZHdCOloq89kP0qJcQc3zn3DF4T+PZlX0ZaH4\nWRWO7JawAfvR0POyf6O2XbQTxsIZ2Vzz5hFP4vMFR6dNDPMB5nmryfpNLvTtX5Iq\nCP+eUV9DKwKBgEQrvgca/NXr+mMBhqUpVqHVqtsdLJa8S3esCJLtG1cYox8QRq5M\naGbxxUC2StjhaA9G1nc6dBXP3EFGFVAybN/L8YFHRmQF6E5R6Ro8hGU+lNXU+L3k\nOWBXv4ph8h8NOX1g4EP/0p7cXSxfUDeQJ0GVkzDY44+4dxgfiWcUoj8hAoGBALKS\ndCzwWNjTSX2g/4hOkilZgHQlfV7OnZTrIOHdjN1JKBldMTy4atlqbY5DEhRzt+3h\nJFqFiYWcDsbD2v0uuuVU20YwlTDz8N1sS4gVqCm/3DPCZBP3DSESPDjlAfF79wp7\nCeBdDTsAoXGrnyNOD6EL7IgLAXy+qfwekbgIY9k7AoGBAJThMbIrtETyxxKecxgB\nh7KrqBnOXDfVGhfcLVaIkx2tyZrDm7xwEMnnKHNqZTwm66X8CV4hNax/JAbhsd8B\nxov3Fq3DAO8ngfoiQuDZDmopG4vcMTcenM5DJ9Y+/EQ5gJ/5UtZkfcepsUkk8cLn\n6ztTqsX73vqJUZtSGsMKwh6L\n-----END PRIVATE KEY-----\n",
    "client_email":
        "new-service-account@planar-door-381921.iam.gserviceaccount.com",
    "client_id": "104071284390828832854",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/new-service-account%40planar-door-381921.iam.gserviceaccount.com"
  });

  Future<DetectIntentResponse?> setFlow(String text) async {
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
