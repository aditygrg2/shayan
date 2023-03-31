import 'package:flutter/material.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionModal extends StatelessWidget {
  String? permissionName;
  IconData? icon;

  PermissionModal({this.permissionName, this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButtonWithoutIcon(
          text: 'Open Settings',
          onPressedButton: () => openAppSettings(),
        ),
        ElevatedButtonWithoutIcon(
          text: 'Close',
          onPressedButton: () => Navigator.of(context).pop(),
        ),
      ],
      icon: Icon(
        icon,
        size: 50,
      ),
      elevation: 20,
      title: Center(
          child: Text(
        "Enable $permissionName",
        style: Theme.of(context).textTheme.headlineLarge,
      )),
      content: Text(
        'Allow the app to use your device\'s $permissionName',
        textAlign: TextAlign.center,
      ),
    );
  }
}
