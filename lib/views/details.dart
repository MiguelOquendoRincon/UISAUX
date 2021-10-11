import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  static const routeName = 'details';
  const Details({ Key key }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${args.nombre}',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context), color: Colors.white,),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Container(
            child: Text('A continuación encontrarás un resumen sobre la auxiliatura que seleccionaste:'),
          ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Area: ${args.area}'),
                Text('${args.nombre}')
              ],
            )
          ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Column(
              children: [
                Text('La auxiliatura requiere un mínimo de: ${args.duracion}'),
                SizedBox(height: 15.0),
                Text('IMPORTANTE: Necesitas un promedio igual o superior a:  ${args.promedio}', style: TextStyle(fontWeight: FontWeight.bold), )
              ],
            )
          ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Column(
              children: [
                Text('Estarás bajo las instrucciones de: ${args.responsable}'),
                SizedBox(height: 15.0),
                Text('El lugar para desarrollar tus actividades es:  ${args.lugar}', style: TextStyle(fontWeight: FontWeight.bold), )
              ],
            )
          ),

          Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Text('Descripción: ${args.descripcion}'),
          ),
          

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
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
              onPressed: (){},
              color: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).primaryColor,
              child: Text('Quiero aplicar a esta auxiliatura', style: TextStyle(color: Colors.white),)
            )
          )
          
        ],
      ),
    );
  }
}