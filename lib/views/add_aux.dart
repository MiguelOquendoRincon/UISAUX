import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uis_aux/models/listadoAux_model.dart';


class AddAux extends StatefulWidget {
  static const routeName = 'addAux';
  const AddAux({ Key key }) : super(key: key);

  @override
  _AddAuxState createState() => _AddAuxState();
}




class _AddAuxState extends State<AddAux> {


  String _chosenValue = 'Abierta';
  TextEditingController nameController = new TextEditingController();
  TextEditingController duracionController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController promedioController = new TextEditingController();
  TextEditingController lugarController = new TextEditingController();
  TextEditingController responsableController = new TextEditingController();
  TextEditingController descripcionController = new TextEditingController();


  // List<Map> lista =[
  //   {
  //     "nombre": "Auxiliatura cálculo",
  //     "duracion": "12 horas semanales",
  //     "area": "Matematicas",
  //     "promedio": 3.5,
  //     "lugar": "Camilo Torres",
  //     "id": 1,
  //     "responsable": "Juan Martinez",
  //     "descripcion": "Auxiliatura que busca dar apoyo a los estudiantes en la materia de cálculo multivariable",
  //     "status": 1
  //   },
  //   {
  //     "nombre": "Auxiliatura fisica",
  //     "duracion": "15 horas semanales",
  //     "area": "Fisica",
  //     "promedio": 3.9,
  //     "lugar": "Camilo Torres",
  //     "id": 2,
  //     "responsable": "Fernanda Torres",
  //     "descripcion": "Auxiliatura que busca dar apoyo a los estudiantes en la materia de física electromagnetica",
  //     "status": 1
  //   },
  //   {
  //     "nombre": "Auxiliatura química",
  //     "duracion": "10 horas semanales",
  //     "area": "Química",
  //     "promedio": 3.4,
  //     "lugar": "Camilo Torres",
  //     "id": 3,
  //     "responsable": "Diana Rodriguez",
  //     "descripcion": "Auxiliatura que busca dar apoyo a los estudiantes en la materia de química",
  //     "status": 0
  //   },
  //   {
  //     "nombre": "Auxiliatura programación",
  //     "duracion": "13 horas semanales",
  //     "area": "Programación",
  //     "promedio": 3.7,
  //     "lugar": "Laboratorios Pesados",
  //     "id": 4,
  //     "responsable": "Sergio Arboleda",
  //     "descripcion": "Auxiliatura que busca dar apoyo a los estudiantes en la materia de programación",
  //     "status": 1
  //   },
  //   {
  //     "nombre": "Auxiliatura algebra",
  //     "duracion": "12 horas semanales",
  //     "area": "Matematicas",
  //     "promedio": 3.8,
  //     "lugar": "Camilo Torres",
  //     "id": 5,
  //     "responsable": "Luis Roncancio",
  //     "descripcion": "Auxiliatura que busca dar apoyo a los estudiantes en la materia de algebra",
  //     "status": 1
  //   },
  //   {
  //     "nombre": "Auxiliatura Analisis Numerico",
  //     "duracion": "8 horas semanales",
  //     "area": "Matematicas",
  //     "promedio": 3.5,
  //     "lugar": "Laboratorios Pesados",
  //     "id": 6,
  //     "responsable": "Juliana Mantilla",
  //     "descripcion": "Auxiliatura que busca dar apoyo a los estudiantes en la materia de cálculo multivariable",
  //     "status": 1
  //   }
  // ];
  

  


  List<ListadoAux> listaAux;

  var args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    print(args);
    listaAux = args;


    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva auxiliatura', style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () => Navigator.pop(context)),
        centerTitle: true,
      ),
      body: _body(),
    );
  }


  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Nombre',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: duracionController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Duracion (en horas)',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: areaController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Area',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: promedioController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Promedio',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: lugarController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Lugar',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: responsableController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Responsable',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
            height: 60.0,
            child: TextField(
              controller: descripcionController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Descripción',
                suffixIcon: Icon(Icons.supervised_user_circle),
                labelStyle: TextStyle(
                  fontSize: 18.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 60.0,
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            padding: EdgeInsets.only(left: 10.0, top: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey
              )
            ),
            child: DropdownButton<String>(
              underline: Container(),
              isExpanded: true,
              value: _chosenValue,
              iconEnabledColor:Colors.black,
              items: <String>[
                'Abierta',
                'Cerrada',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:TextStyle(color:Colors.black),),
                );
              }).toList(),
              hint:Text(
                "Escoge un estado",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String value) {
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
          ),


          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.0,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: FlatButton(
              onPressed: () {
                var newElement = ListadoAux.fromJson({
                  "nombre": nameController.text,
                  "duracion": duracionController.text + " horas semanales",
                  "area": areaController.text,
                  "promedio": promedioController.text,
                  "lugar": lugarController.text,
                  "id": 7,
                  "responsable": responsableController.text,
                  "descripcion": descripcionController.text,
                  "status": _chosenValue == 'Abierta' ? 1 : 0
                });

                listaAux.add(newElement);

                Navigator.pushReplacementNamed(context, 'new_menu' , arguments: listaAux);

              },
              color: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).primaryColor,
              child: Text('Agregar', style: TextStyle(color: Colors.white),)
            )
          )
        ],
      ),
    );
  }
}