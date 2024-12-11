import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Editar extends StatelessWidget {
  const Editar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("EDITAR FIREBASE"),),
      body: Column(
        children: [
          formularioUsuario(),
          Divider(),
          formularioEliminar()
        ],
      ),
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

      ElevatedButton(onPressed: ()=> editar(_cedula.text, _nombre.text, _edad, _ciudad.text ), 
      child: Text("Guardar", style: TextStyle(fontSize:25 ),))
    ],
  );
}

Future<void> editar(cedula, nombre, edad, ciudad) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+ cedula);

  await ref.update({
    "nombre": nombre,
    "edad": edad,
    "ciudad": ciudad
    
  });
}


///////////////// ELIMINAR

Widget formularioEliminar(){
  TextEditingController _cedula = TextEditingController();
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _cedula,
          decoration: InputDecoration(
            label: Text("Cedula"),
            fillColor: Color.fromRGBO(231, 52, 52, 1),
            filled: true,
            border: OutlineInputBorder()
          ),
        ),
      ),
      IconButton(onPressed: ()=> eliminar(_cedula.text), icon: Icon(Icons.delete))
    ],
  );
}


Future<void> eliminar( cedula ) async {
   DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+ cedula);

  await ref.remove();
}

