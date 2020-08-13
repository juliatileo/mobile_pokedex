import 'package:flutter/material.dart';

class StatIndicator extends StatelessWidget {
  final String statName;
  final double baseStat;
  selectColor(double baseStat) {
    if (baseStat <= 30) {
      return Color(0xffeb3459);
    } else if (baseStat >= 30 && baseStat <= 49) {
      return Color(0xffeb9334);
    } else if (baseStat >= 50 && baseStat <= 99) {
      return Color(0xffebd334);
    } else if (baseStat >= 100 && baseStat <= 149) {
      return Color(0xff34eb52);
    } else {
      return Color(0xff34eba5);
    }
  }

  StatIndicator({this.statName, this.baseStat});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[
        Container(width: 150, child: Text(this.statName)),
        Container(
          height: 20,
          width: this.baseStat >= 200 ? this.baseStat * 1.1 : this.baseStat * 1.5,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: this.selectColor(this.baseStat)),
          child: Center(
            child: Text(
              this.baseStat.toStringAsFixed(0),
              style: TextStyle(color: Colors.white, shadows: [Shadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))]),
            ),
          ),
        )
      ]),
    );
  }
}
