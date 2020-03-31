import 'package:flutter/material.dart';


class CardGame extends StatelessWidget {
  CardGame({this.amount, this.color});

  final Color color;
  final int amount;


  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.15;
    final cardHeight = MediaQuery.of(context).size.height * 0.10;
    
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10),
        height: cardHeight + 10.0,
        width: cardWidth + 10.0,
    //    color: Colors.black12,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.black54, //new Color.fromRGBO(255, 0, 0, 0.0),
                borderRadius: new BorderRadius.circular(5.0),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    '$amount',
                    style: new TextStyle(
                        fontSize: 28.0,
                        fontFamily: 'Roboto',
                        color: color
                    )
                  )
                ],
              ),
              ),
          ),
        )
      ),
    );
  }
}