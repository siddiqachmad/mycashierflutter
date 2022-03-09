import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  String gambar;
  String nama_menu;
  String harga;
  CardGrid({required this.gambar,required this.nama_menu,required this.harga});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(gambar,fit: BoxFit.cover,),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(nama_menu,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(harga.toString(),
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
