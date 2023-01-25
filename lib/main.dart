import 'package:agumentik/bloc/dummy_logic_bloc.dart';
import 'package:agumentik/screens/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agumentik',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              elevation: 0.50,
              titleTextStyle: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.black))),
      home: BlocProvider(
        create: (context) => DummyLogicBloc(),
        child: HomePage(),
      ),
    );
  }
}
