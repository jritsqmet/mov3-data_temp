import 'package:app_fire_datos/screens/editar_Screen.dart';
import 'package:app_fire_datos/screens/guardar_Screen.dart';
import 'package:app_fire_datos/screens/leer_Screen.dart';
import 'package:flutter/material.dart';

//FIRE
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo()
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("FIREBASE"),),
      body: Editar(),
    );
  }
}