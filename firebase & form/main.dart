// import 'package:flutter/material.dart';
// import 'package:furnitureui/common/color_constants.dart';
// import 'package:furnitureui/screen/home_page_screen.dart';

// /*
// Title:This is the Entry Point
// Purpose:This is the Entry Point
// Created Date:17 March
// Created By:Kalpesh Khandla
// */

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         appBarTheme: AppBarTheme(
//           iconTheme: IconThemeData(
//             color: ColorConstants.primaryColor,
//           ),
//           elevation: 0,
//           color: Colors.white,
//         ),
//       ),
//       home: HomePageScreen(),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:furnitureui/screen/signin_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAUxCxiNwvVPCN2lPhb48d4MlDbrpVOSGg',
    appId: '1:844391241547:android:b03c2b8182264d1ad0face',
    messagingSenderId:
        '275734805552-e847odsg0trkg9t8pndd0rq7d7e67u09.apps.googleusercontent.com',
    projectId: 'furnitureapp-8c6f8',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}
