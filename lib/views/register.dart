import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uis_aux/models/usuario_model.dart';
import 'package:uis_aux/providers/db_provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';
  const RegisterScreen({ Key key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String _chosenValue = 'Estudiante';


  bool seePassword = false;
  bool seePassword2 = false;
  // await DBPovider.db.getUsuarioByUser(userController.text);
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController password2Controller = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController rolController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Ingresa tus datos',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: _inputs(),
        )
      ),
    );
  }

  Widget _inputs(){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0, bottom: 15.0),
          height: 60.0,
          child: TextField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Nombre(s)',
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
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          height: 60.0,
          child: TextField(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Apellido(s)',
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
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          height: 60.0,
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Celular',
              suffixIcon: Icon(Icons.phone_iphone),
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
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          height: 60.0,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Email',
              suffixIcon: Icon(Icons.email),
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
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          height: 60.0,
          child: TextField(
            obscureText: !seePassword,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: (){
                  setState(() {
                    seePassword = !seePassword;
                  });
                },
              ),
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
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          height: 60.0,
          child: TextField(
            obscureText: !seePassword2,
            controller: password2Controller,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Confirmar Contraseña',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: (){
                  setState(() {
                    seePassword2 = !seePassword2;
                  });
                },
              ),
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
              'Estudiante',
              'Docente',
              'Administrativo',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style:TextStyle(color:Colors.black),),
              );
            }).toList(),
            hint:Text(
              "Please choose a langauage",
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

        _botonRegistro()
      ],
    );
  }

  Widget _botonRegistro(){
    return Container(
      margin: EdgeInsets.only(top: 50.0, right: 20.0),
      width: MediaQuery.of(context).size.width * 0.40,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0XFF0CCC29),
      ),
      child: FlatButton(
        onPressed: () async {
          print(emailController.text);
          if(emailController.text == '' || passwordController.text == '' 
          || password2Controller.text == '' || nameController.text == ''
          || lastNameController.text == '' || phoneController.text == ''
          ){
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Ups! Por favor llena todos los datos'),
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
          } else{
            if(passwordController.text != password2Controller.text){
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Ups! Verifica que tus contraseñas coincidan'),
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
            }else if(_isEmail(emailController.text)){
              if(phoneController.text.length != 10){
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Ups! El número celular tiene una longitud incorrecta'),
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

              } else{
                try{
                  Usuario user = Usuario.fromJson({
                    "usuario": emailController.text.trim(),
                    "password": passwordController.text,
                    "nombre": nameController.text,
                    "apellido": lastNameController.text,
                    "phone": phoneController.text.trim(),
                    "rol": _chosenValue
                  });
                  await DBPovider.db.nuevoUsuario(user);
                  Navigator.pushReplacementNamed(context, 'menu', arguments: user);
                  
                } catch(e){
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Ups! Parece que tenemos problemas. Intentalo de nuevo'),
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

              }
              
            } else{
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Ups! Ingresa un email valido'),
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
          }
        },
        child: Text(
          'Registrarme',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold
          ),
        ),
        splashColor: Color(0XFF73E937)
      ),
    );
  }


  bool _isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}