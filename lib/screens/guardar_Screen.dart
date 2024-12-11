import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class Guardar extends StatelessWidget {
  const Guardar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
      ),
      body: formularioUsuario(),
    );
  }
}

Widget formularioUsuario() {
  TextEditingController _cedula = TextEditingController();
  TextEditingController _nombre = TextEditingController();
  TextEditingController _edad = TextEditingController();
  TextEditingController _ciudad = TextEditingController();

  return Column(
    children: [
      TextField(
        controller: _cedula,
        decoration: InputDecoration(
            label: Text("cedula"), border: OutlineInputBorder()),
      ),
      TextField(
        controller: _nombre,
        decoration: InputDecoration(
            label: Text("nombre"), border: OutlineInputBorder()),
      ),
      TextField(
        keyboardType: TextInputType.numberWithOptions(),
        controller: _edad,
        decoration:
            InputDecoration(label: Text("edad"), border: OutlineInputBorder()),
      ),
      TextField(
        controller: _ciudad,
        decoration: InputDecoration(
            label: Text("ciudad"), border: OutlineInputBorder()),
      ),

      ElevatedButton(onPressed: ()=> guardar(_cedula.text, _nombre.text, _edad, _ciudad.text ), 
      child: Text("Guardar", style: TextStyle(fontSize:25 ),))
    ],
  );
}

Future<void> guardar( cedula, nombre, edad, ciudad) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+ cedula);

  await ref.set({
    "nombre": nombre,
    "edad": edad,
    "ciudad": ciudad
    
  });
}