import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';
  const RegisterScreen({ Key key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String _chosenValue = 'Auxiliatura de interes';

  bool seePassword = false;
  bool seePassword2 = false;


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
              'Auxiliatura de interes',
              'Android',
              'IOS',
              'Flutter',
              'Node',
              'Java',
              'Python',
              'PHP',
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
      ],
    );
  }
}