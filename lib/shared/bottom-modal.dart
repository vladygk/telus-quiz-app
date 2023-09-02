import 'package:flutter/material.dart';

class BottomModel {
  static void showBottomModal(
      {required BuildContext context,
      required Color bg,
      required String title,
      required String subtitle,
      required IconData icon}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(color: bg),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ListTile(
                leading: Icon(icon),
                title: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Implement share functionality here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
