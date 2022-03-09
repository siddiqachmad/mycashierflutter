import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
dialog(_context,msg,{title}){
  showDialog(context: _context,
      builder: (BuildContext context){
      return AlertDialog(
        title: Text(title ?? "Perhatian!"),
        content: Text(msg),
      );
    }
  );
}

Widget largeButton({String label="Simpan",IconData? iconData,required GestureTapCallback onPressed}){
  iconData = iconData ?? Icons.done_all;
  return Container(
    height: 60,
    width: double.infinity,
    child: new ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData),
        label: Text(
            label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0
        ),),

    ),
  );

}
String toRupiah(int val){
  return NumberFormat.currency(locale: 'IDR').format(val);
}
