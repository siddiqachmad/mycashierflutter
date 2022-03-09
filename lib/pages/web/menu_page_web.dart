import 'package:flutter/material.dart';
import 'package:mycashierdicoding/component/card_list.dart';
import 'package:mycashierdicoding/component/custom_text_field.dart';
import 'package:mycashierdicoding/component/util.dart';
import 'package:mycashierdicoding/models/Keranjang.dart';
import 'package:mycashierdicoding/models/Menu.dart';

class MenuPageWeb extends StatefulWidget {
  List<Menu> dataMenu;
  MenuPageWeb({required this.dataMenu});
  @override
  _MenuPageWebState createState() => _MenuPageWebState();
}

class _MenuPageWebState extends State<MenuPageWeb> {
  List<Keranjang> dataKeranjang=[];
  TextEditingController etBayar=new TextEditingController();
  int totalBayar=0;

  hitungTotalBayar(){
    totalBayar=0;
    if(dataKeranjang.length>0){
      for(int i=0;i<dataKeranjang.length;i++){
        int harga=dataKeranjang[i].harga;
        totalBayar+=harga;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:  GridView.count(
              crossAxisCount: 4,
              children: widget.dataMenu.map((menu){
                return InkWell(
                  onTap: (){
                    Keranjang keranjang=new Keranjang(id_menu: menu.id, nama_menu: menu.nama_menu, jumlah: 1, harga: menu.harga, gambar: menu.gambar);
                    dataKeranjang.add(keranjang);
                    hitungTotalBayar();
                    setState(() {

                    });
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(menu.gambar,fit: BoxFit.cover,),
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(menu.nama_menu,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(menu.harga.toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 12.0,),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text("Keranjang", style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(itemBuilder: (context,index){
                    final Keranjang keranjang=dataKeranjang[index];
                    return InkWell(
                      child: CardList(gambar: keranjang.gambar, nama_menu: keranjang.nama_menu, harga: keranjang.harga.toString()),
                      onTap: (){

                      },
                    );
                  },itemCount: dataKeranjang.length,),
                  flex: 3,
                ),
                SizedBox(height: 8.0,),
                Expanded(
                  flex: 1,
                  child: _formWidget()
                )
              ],
            )
          )
        ],
      ),

    );
  }

  Widget _formWidget(){
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Bayar : $totalBayar",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              color: Colors.red
            ),
          ),
          SizedBox(height: 16,),
          CustomTextField(controller: etBayar,hintText: "Jumlah Bayar",icon: Icon(Icons.money),isPassword: false,),
          SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(child: Text("Bayar"), onPressed: (){

            },),
          )
        ],
      ),
    );
  }
}
