import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: Text("Settings"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode", 
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                CupertinoSwitch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value){
                    themeProvider.toggleTheme();
                  },
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
