import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Language')),
      body: ListView(
        children: <Widget>[
          // ListTiles for each language option
          ListTile(
            title: Text('English'),
            onTap: () {
              _setLocale(context, Locale('en', ''));
            },
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () {
              _setLocale(context, Locale('es', ''));
            },
          ),
          // Add more languages here
        ],
      ),
    );
  }

  void _setLocale(BuildContext context, Locale newLocale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);
    await prefs.setString('country_code', newLocale.countryCode ?? '');

    // Use a state management solution like Provider, setState, or another to update the app's state
    MyApp.of(context)?.setLocale(newLocale);
  }
}
