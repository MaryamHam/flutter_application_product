import 'package:flutter/material.dart';
import 'package:flutter_application_product/db/offline/shared_helper.dart';
import 'package:flutter_application_product/root/app_root.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
   
  await SharedHelper.init();

  runApp(const AppRoot());
}

