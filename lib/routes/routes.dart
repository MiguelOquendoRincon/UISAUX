import 'package:flutter/widgets.dart';
import 'package:uis_aux/routes/auxList2.dart';
import 'package:uis_aux/views/add_aux.dart';
import 'package:uis_aux/views/auxList.dart';
import 'package:uis_aux/views/details.dart';
import 'package:uis_aux/views/login.dart';
import 'package:uis_aux/views/register.dart';

Map<String, WidgetBuilder> appRoutes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  RegisterScreen.routeName: (BuildContext context) => RegisterScreen(),
  AUXLIST.routeName: (BuildContext context) => AUXLIST(),
  Details.routeName: (BuildContext context) => Details(),
  AddAux.routeName: (BuildContext context) => AddAux(),
  AUXLIST2.routeName: (BuildContext context) => AUXLIST2(),
};
