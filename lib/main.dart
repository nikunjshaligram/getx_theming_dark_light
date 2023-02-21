// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use, prefer_final_fields, prefer_if_null_operators, use_key_in_widget_constructors, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_theming_dark_light/theme_service.dart';
import 'package:getx_theming_dark_light/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// ThemeData _darkTheme = ThemeData(
//   accentColor: Colors.red,
//   brightness: Brightness.dark,
//   primaryColor: Colors.amber,
//   buttonTheme: const ButtonThemeData(
//     buttonColor: Colors.amber,
//     disabledColor: Colors.grey,
//   ),
// );

// ThemeData _lightTheme = ThemeData(
//   accentColor: Colors.lightBlue,
//   brightness: Brightness.light,
//   primaryColor: Colors.blue,
//   buttonTheme: const ButtonThemeData(
//     buttonColor: Colors.blue,
//     disabledColor: Colors.grey,
//   ),
// );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // RxBool _isLightTheme = false.obs;

  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // _saveThemeStatus() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _isLightTheme.value);
  // }

  // _getThemeStatus() async {
  //   var _isLight = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  //   }).obs;
  //   _isLightTheme.value = (await _isLight.value)!;
  //   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  // }

  // MyApp() {
  //   _getThemeStatus();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
    // return GetMaterialApp(
    //   theme: _lightTheme,
    //   darkTheme: _darkTheme,
    //   themeMode: ThemeMode.system,
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Dark Mode Demo'),
    //     ),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Obx(
    //             () => Text(
    //               'Click on switch to change to ${_isLightTheme.value ? 'Dark' : 'Light'} theme',
    //             ),
    //           ),
    //           ObxValue(
    //             (data) => Switch(
    //               value: _isLightTheme.value,
    //               onChanged: (val) {
    //                 _isLightTheme.value = val;
    //                 Get.changeThemeMode(
    //                   _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
    //                 );
    //                 _saveThemeStatus();
    //               },
    //             ),
    //             false.obs,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.bottomAppBarColor,
        title: const Text("Flutter Change Dynamically Theme Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.theme.buttonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: ThemeService().switchTheme,
                child: const Text('Change Theme')),
          ],
        ),
      ),
    );
  }
}
