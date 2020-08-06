import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final String categoryTitle;
  final Function navigateTo;

  Categories({this.color, this.imageUrl, this.categoryTitle, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Material(
          color: this.color,
          child: InkWell(
            onTap: this.navigateTo,
            child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        child: Image.network(this.imageUrl),
                      ),
                      Text(
                        this.categoryTitle,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
