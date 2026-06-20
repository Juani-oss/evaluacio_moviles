import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Externo"),),
      body: Column(
        children: [
          Text("Lista Externa"),
          Flexible(child: ListaExt(context)),
        ],
      ),
    );
  }
}

//funcion que lea un json mediante una url

Future<List> leerURL(String url) async {
  final respuesta = await http.get( Uri.parse(url) );


  return json.decode(respuesta.body)["peliculas"];

}

Widget ListaExt(BuildContext context){
  String url ="https://jritsqmet.github.io/web-api/peliculas3.json";
  return FutureBuilder(future: leerURL(url), builder:(context, snapshot) {
    if(snapshot.hasData){
      final data = snapshot.data!;
      return ListView.builder(itemCount:data.length, itemBuilder:(context, index) {
        final item = data[index];
        return ListTile(
          title: Text(item["id"].toString()),
          subtitle: Column(
            children: [
              Text(item["titulo"]),
            ],
          ),
          onTap: () => verMas(context, item),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.movie)),
        );
      }, );
    }else{
      return Column(
        children: [
          (Text("NO HAY DATOS PARA MOSTRAR")),
          CircularProgressIndicator(),
        ],
      );

    }
  },);
}

void verMas(BuildContext context, pelicula){
  showDialog(context: context, builder:(context) => 
  AlertDialog(
    title: Text(pelicula["lanzamiento"] ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(pelicula["imagen"]),
        Text(pelicula["director"]),
        Text(pelicula["descripcion"]),
        Text(pelicula["valoracion"].toString())
      ],
    ),
  )
  ,);
}

void aviso(BuildContext context, aviso){
showAboutDialog(context: context);
}