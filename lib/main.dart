import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/news_row.dart';
import 'package:mnews/pages/home.dart';
import 'package:mnews/pages/news_details.dart';
import 'package:mnews/pages/splash.dart';
import 'package:mnews/routes.dart';

import 'localization/app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',

      debugShowCheckedModeBanner: false,
      // Theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //Supported Locals
      supportedLocales: [
        Locale('en', 'US'),
//        Locale('ar', 'EG'),
      ],
      routes: {
        NewsDetailsRoute: (context) => NewsDetails(),
      },
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
//      localeResolutionCallback: (locale, supportedLocales) {
//        // Check if the current device locale is supported
//        for (var supportedLocale in supportedLocales) {
//          if (supportedLocale.languageCode == locale.languageCode &&
//              supportedLocale.countryCode == locale.countryCode) {
//            return supportedLocale;
//          }
//        }
//        // If the locale of the device is not supported, use the first one
//        // from the list (English, in this case).
//        return supportedLocales.first;
//      },

      home: SplashScreen(),
    );
  }
}
