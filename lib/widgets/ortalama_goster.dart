import 'package:agnocalculator/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrtalamaGoster extends StatelessWidget {

  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({required this.ortalama, required this.dersSayisi, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      
      children: [
        Text(dersSayisi > 0 ? "$dersSayisi Ders Girildi" : " Ders Seciniz", style: TextStyle(color: Sabitler.anaRenk),),
        Text(ortalama > 0 ?"${ortalama.toStringAsFixed(2)}" : "0.0", style:  Sabitler.ortHesaplaStyle2,),
        Text("Ortalama", style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w600, color: Sabitler.anaRenk),)
      ],
    );
  }
}