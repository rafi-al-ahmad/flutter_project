import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/introduction_screen.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'package:flutter/services.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(ChangeNotifierProvider(
      create: (context) => AppDeterminants(), child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: [
        Locale("en", ""),
        Locale("ar", ""),
      ],
      locale: Locale(Provider.of<AppDeterminants>(context).lang),
      home: FutureBuilder(
        future: Provider.of<AppDeterminants>(context).initializeAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              S.load(Locale(Provider.of<AppDeterminants>(context).lang));
             if(Provider.of<AppDeterminants>(context).isLunched){

              if(Provider.of<AppDeterminants>(context).token != "" && DateTime.fromMillisecondsSinceEpoch(int.parse(Provider.of<AppDeterminants>(context).loginAt)).isAfter( DateTime.now().subtract(const Duration(days: 3)))){
                return SchoolExamsTable(title: Provider.of<AppDeterminants>(context).userName);
              }
               return LogInScreen2();
             }
             else return IntroScreen(title: 'IntroScreen',);
            }

            return Center(
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Icon(Icons.school, size: 80,),
              ),
            );

            }),
    );
  }
}
