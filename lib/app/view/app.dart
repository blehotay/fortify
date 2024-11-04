import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:fortify/l10n/l10n.dart';
import 'package:nes_ui/nes_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   ),
      //   useMaterial3: true,
      // ),
      theme: flutterNesTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FortifyCardFront(
        title: 'title',
        category: 'category',
        imageUrl: '',
      ),
      // home: Container(
      //   color: Colors.blue,
      // ),
    );
  }
}
