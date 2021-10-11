import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uis_aux/models/listadoAux_model.dart';

class AUXLIST extends StatefulWidget {
  static const routeName = 'menu';
  const AUXLIST({ Key key }) : super(key: key);

  @override
  _AUXLISTState createState() => _AUXLISTState();
}

class _AUXLISTState extends State<AUXLIST> {

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    getJson();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    getJson();
    setState(() {

    });
    _refreshController.loadComplete();
  }

   List<ListadoAux> listadoAux;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listado Auxiliaturas',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () => _showHelp()
          )
        ],
      ),
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body(){
    
    return FutureBuilder(
      future: getJson(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          listadoAux = listadoAuxFromJson((snapshot.data));
          return _listadoAux();
        } else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


  Widget _listadoAux(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.0),
          height: listadoAux.length * 100.0,
          child: ListView.builder(
            itemCount: listadoAux.length,
            itemBuilder: (_, i){
              // return Container(
              //   child: Text(listadoAux[i].descripcion),
              // );
              return Slidable(
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.03,
                            margin: EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: listadoAux[i].status == 1 ? Theme.of(context).primaryColor : Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              )
                            ),
                            height: 100.0,
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 7.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${listadoAux[i].nombre}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                                Text('Promedio: ${listadoAux[i].promedio}'),
                                
                                Text('Disponibilidad: ${listadoAux[i].duracion}'),

                                Text('Responsable: ${listadoAux[i].responsable}')
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ),
                  onTap: () => Navigator.pushNamed(context, 'details', arguments: listadoAux[i]),
                ),
                actionPane: SlidableDrawerActionPane(),
                secondaryActions: [
                  listadoAux[i].status == 1 
                  ?
                    Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        )
                      ),
                      child: Text('Aplicar', style: TextStyle(color: Colors.white),),
                    )
                  : Container(
                      height: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        )
                      ),
                      child: Text('Avisame cuando esté disponible', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                    )
                ],
              );
          }),
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
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            color: Theme.of(context).primaryColor,
            splashColor: Theme.of(context).primaryColor,
            child: Text('Cerrar sesión', style: TextStyle(color: Colors.white),)
          )
        )
      ],
    );
  }

  _showHelp(){
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 10.0,
            ),
            Text(
              'Estado Abierto',
              style: TextStyle(
                fontSize: 15.0
              ),
            ),
            SizedBox(height: 15.0),
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10.0,
            ),
            Text(
              'Estado Cerrado',
              style: TextStyle(
                fontSize: 15.0
              ),
            )
          ],
        ),
        content: FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Entendido',
            style: TextStyle(
              color: Colors.white
            ),
          )
        ),
      )
    );
  }

  
  Future<String> getJson() {
  return rootBundle.loadString('assets/aux_list.json');
}
}