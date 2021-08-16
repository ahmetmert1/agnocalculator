import 'package:agnocalculator/constants/app_constants.dart';
import 'package:agnocalculator/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title:"Dinamik Ortalama Hesapla",
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,


      ),

      home: OrtalamaHesaplaPage(),
      
    );
  }
}