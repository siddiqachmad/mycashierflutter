import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  String gambar;
  String nama_menu;
  String harga;
  CardList({required this.gambar,required this.nama_menu,required this.harga});
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(gambar),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      nama_menu,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(harga)
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
