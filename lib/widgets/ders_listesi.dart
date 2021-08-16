import 'package:agnocalculator/constants/app_constants.dart';
import 'package:agnocalculator/helper/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataHelper.tumEklenenDersler.length>0 ? ListView.builder(itemCount: DataHelper.tumEklenenDersler.length, itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
            DataHelper.tumEklenenDersler.removeAt(index);

            onDismiss(index);
            
        },
        

        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(DataHelper.tumEklenenDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text((DataHelper.tumEklenenDersler[index].harfDegeri * DataHelper.tumEklenenDersler[index].krediDegeri).toStringAsFixed(1)),
              ),
      
              subtitle: Text("Kredi Degeri : ${DataHelper.tumEklenenDersler[index].krediDegeri}   Harf Degeri : ${DataHelper.tumEklenenDersler[index].harfDegeri}"),
      
            ),
          ),
        ),
      );
    }) : Container(
      child: Center(
        child: Text("Lutfen Ders Ekleyiniz", style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w900 , color: Sabitler.anaRenk),),
      ),
    );
  }
}