import 'package:flutter/material.dart';
import 'package:mycashierdicoding/models/Menu.dart';
import 'package:mycashierdicoding/pages/mobile/menu_page_mobile.dart';
import 'package:mycashierdicoding/pages/web/menu_page_web.dart';

class MenuPage extends StatefulWidget {

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Menu> dataMenu=[
    Menu(id: "1", nama_menu: "Songket A", harga: 1500000, gambar: "images/cashier.png"),
    Menu(id: "2", nama_menu: "Songket B", harga: 2000000, gambar: "images/cashier.png"),
    Menu(id: "3", nama_menu: "Songket C", harga: 5000000, gambar: "images/cashier.png"),
    Menu(id: "4", nama_menu: "Songket D", harga: 3000000, gambar: "images/cashier.png"),
    Menu(id: "5", nama_menu: "Songket E", harga: 3500000, gambar: "images/cashier.png"),
    Menu(id: "6", nama_menu: "Songket F", harga: 4500000, gambar: "images/cashier.png"),
    Menu(id: "7", nama_menu: "Songket G", harga: 500000, gambar: "images/cashier.png"),
    Menu(id: "10", nama_menu: "Songket I", harga: 1000000, gambar: "images/cashier.png"),
    Menu(id: "11", nama_menu: "Songket J", harga: 500000, gambar: "images/cashier.png"),
    Menu(id: "12", nama_menu: "Songket K", harga: 4500000, gambar: "images/cashier.png"),
    Menu(id: "13", nama_menu: "Songket L", harga: 5000000, gambar: "images/cashier.png"),
    Menu(id: "14", nama_menu: "Songket M", harga: 2000000, gambar: "images/cashier.png"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cashier Menu"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints){
          if(constraints.maxWidth>=600){
            return MenuPageWeb(dataMenu: dataMenu,);
          }else{
            return MenuPageMobile(dataMenu: dataMenu,);

          }
        },
      ),
    );
  }
}
