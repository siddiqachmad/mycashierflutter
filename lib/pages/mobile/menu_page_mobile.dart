import 'package:flutter/material.dart';
import 'package:mycashierdicoding/component/keranjang_list.dart';
import 'package:mycashierdicoding/models/Keranjang.dart';
import 'package:mycashierdicoding/models/Menu.dart';

class MenuPageMobile extends StatefulWidget {
  List<Menu> dataMenu;

  MenuPageMobile({required this.dataMenu});
  @override
  _MenuPageMobileState createState() => _MenuPageMobileState();
}


class _MenuPageMobileState extends State<MenuPageMobile> {
  List<Keranjang> dataKeranjang=[];
  int totalKeranjang=0;
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Stack(
        children: [
          GridView.count(
            crossAxisCount: 4,
            children: widget.dataMenu.map((menu){
              return InkWell(
                onTap: (){
                  Keranjang keranjang=new Keranjang(id_menu: menu.id, nama_menu: menu.nama_menu, jumlah: 1, harga: menu.harga, gambar: menu.gambar);
                  dataKeranjang.add(keranjang);
                  totalKeranjang=dataKeranjang.length;
                  if(totalKeranjang>0){
                    isVisible=true;
                  }
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text("Keranjang $totalKeranjang"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return KeranjangList(data: dataKeranjang);

                    }));
                  },
                ),
              ),
              visible: isVisible,
            )
          )
        ],
      )
    );
  }
}
