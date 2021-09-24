import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({ Key key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  Size size;
  bool seePassword = false;

  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _inputsContainer(),
              _buttonsContainer(),
              // _socialContainer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputsContainer(){
    return Container(
      // color: Colors.blue,
      width: size.width,
      // height: size.height * 0.62,
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.only(top: size.height * 0.05),
            child: Text(
              'Bienviendo a UISAUX',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0XFF0CCC29),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            width: size.width * 1,
            child: Image.asset('assets/login(1).png'),
          ),
          _inputs()
        ],
      )
    );
  }

  Widget _inputs(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 20.0,
            offset: Offset(5, 10)
          )
        ]

      ),
      margin: EdgeInsets.only(left: size.width * 0.07, top: 30.0, right: size.width * 0.07),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Inicio de Sesión',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: '',
                labelText: 'Usuario',
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
            height: 50.0,
            margin: EdgeInsets.only(top: 30.0),
            child: TextField(
              obscureText: !seePassword,
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
            // margin: EdgeInsets.only(left: 190.0),
            child: CheckboxListTile(
                title: Text(
                  'Recordarme',
                  textAlign: TextAlign.right,
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue;
                  });
                },
                activeColor: Theme.of(context).primaryColor,
                controlAffinity: ListTileControlAffinity.trailing,  //  <-- leading Checkbox
              ),
          ),
        ],
      ),
    );
  }


  Widget _buttonsContainer(){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 20.0),
            width: size.width * 0.40,
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0XFF0CCC29),
            ),
            child: FlatButton(
              onPressed: () => Navigator.pushNamed(context, 'register'), 
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
          ),

          Container(
            margin: EdgeInsets.only(top: 50.0, right: 20.0),
            width: size.width * 0.40,
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0XFF0CCC29),
            ),
            child: FlatButton(
              onPressed: (){}, 
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              splashColor: Color(0XFF73E937)
            ),
          ),

          
        ],
      ),
    );
  }

  
}