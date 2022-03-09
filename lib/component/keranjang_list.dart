import 'package:flutter/material.dart';
import 'package:mycashierdicoding/component/card_list.dart';
import 'package:mycashierdicoding/models/Keranjang.dart';

class KeranjangList extends StatefulWidget {
  List<Keranjang> data;
  KeranjangList({required this.data});
  @override
  _KeranjangListState createState() => _KeranjangListState();
}

class _KeranjangListState extends State<KeranjangList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        final Keranjang keranjang=widget.data[index];
        return InkWell(
          child: CardList(gambar: keranjang.gambar, nama_menu: keranjang.nama_menu, harga: keranjang.harga.toString()),
          onTap: (){

          },
        );
      },itemCount: widget.data.length,),
    );
  }
}
