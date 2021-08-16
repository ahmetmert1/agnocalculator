import 'package:agnocalculator/constants/app_constants.dart';
import 'package:agnocalculator/helper/data_helper.dart';
import 'package:agnocalculator/model/ders.dart';
import 'package:agnocalculator/widgets/ders_listesi.dart';
import 'package:agnocalculator/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({ Key? key }) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

  double secilenDeger = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(Sabitler.baslik,style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.w900 , color: Sabitler.anaRenk)),
        elevation: 0,
        centerTitle: true,
      ),

      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Row(
              children: [
                Expanded(
                  flex: 2,
              child: Container(
                child: _buildForm(),
               
              ),
            ),
            Expanded(
              flex: 1,
              child: OrtalamaGoster(ortalama: DataHelper.ortalamaHesapla(), dersSayisi: DataHelper.tumEklenenDersler.length)
            )
              ],
            ),

            Expanded(
              child: DersListesi(
                onDismiss: (index){
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {
                    
                  });
                  print("Eleman cikarildi index $index");
                },
              ),
            )

          ],
      )
      
      )
      
      
      
      
    );
  }

 
Widget  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHarfler(),
                _buildKrediler(),
                IconButton(onPressed: (){
                  _dersEkleVeOrtalamaHesapla();
                }, icon: Icon(Icons.arrow_forward_ios_rounded), color: Sabitler.anaRenk, iconSize: 30,),
              ],
            ),
          )
        ],

      )
    
    
    
    );
  }

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: (deger){
            setState(() {
              girilenDersAdi = deger!;
            });
        },

        validator: (s){
          if(s!.length <= 0){
            return "Ders Adını Giriniz";
          }else{
            return null;
          }
        },
        
        decoration: InputDecoration(
          hintText: "Matematik",
          filled: true,
          fillColor: Sabitler.anaRenk.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: Sabitler.anaBorderRadius,
            
          )
        ),


      ),
    );
  }

  _buildHarfler() {




    

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade300.withOpacity(0.2),
        borderRadius: Sabitler.anaBorderRadius
      ),
      child: DropdownButton <double>(
        //bu value default value hint gibi düşünülebilir
        value: secilenDeger,
        underline: Container(),

        onChanged: (deger){
          setState(() {
            secilenDeger = deger!;
          });
        },
        items: 
      
             DataHelper.tumDerslerinHArfleri(),

      ),
    );
  }

  
  
  _buildKrediler() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade300.withOpacity(0.2),
        borderRadius: Sabitler.anaBorderRadius
      ),
      child: DropdownButton <double>(
        //bu value default value hint gibi düşünülebilir
        value: secilenKrediDegeri,
        underline: Container(),

        onChanged: (deger){
          setState(() {
            secilenKrediDegeri = deger!;
          });
        },
        items: 
      
             DataHelper.tumKrediler(),

      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {

      if(formKey.currentState!.validate()){
        formKey.currentState!.save();
        var eklenecekDers = Ders(ad: girilenDersAdi, harfDegeri: secilenDeger, krediDegeri: secilenKrediDegeri);
        print(eklenecekDers.krediDegeri);
        print(eklenecekDers.ad);
        print(eklenecekDers.harfDegeri);

        DataHelper.dersEkle(eklenecekDers);

        print(DataHelper.tumEklenenDersler);

        print("Ortalama değeri  $DataHelper.ortalamaHesapla()");

        setState(() {
          
        });

        

      }

  }


}




