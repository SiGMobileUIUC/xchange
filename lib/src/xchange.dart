import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:xchange/src/misc/colors.dart';
import 'package:xchange/src/screens/home.dart';

class XChange extends StatefulWidget {
  const XChange({Key? key}) : super(key: key);

  @override
  _XChangeState createState() => _XChangeState();
}

class _XChangeState extends State<XChange> {
  @override
  Widget build(BuildContext context) {
    var darkTheme = const CupertinoThemeData.raw(
      Brightness.dark,
      AppColors.secondaryUofILightest,
      AppColors.secondaryUofILight,
      CupertinoTextThemeData(textStyle: TextStyle(color: Colors.white)),
      AppColors.secondaryUofIDark,
      Colors.black,
    );
    const lightTheme = CupertinoThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      barBackgroundColor: AppColors.secondaryUofILight,
      primaryColor: AppColors.secondaryUofILightest,
    );
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.secondaryUofILight,
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        canvasColor: Colors.black,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryUofI,
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: "xChange",
          home: const Home(),
          material: (_, __) => MaterialAppData(
            themeMode: ThemeMode.system,
          ),
          cupertino: (ctx, __) => CupertinoAppData(
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
