import 'package:flutter/material.dart';

class HeaderNews extends StatelessWidget {
   HeaderNews({Key key, this.title, this.prefix, this.onTap}) : super(key: key);
   final String title;
   final String prefix;
   final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Show All',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
