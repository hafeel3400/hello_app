import 'package:flutter/material.dart';
import 'package:hello_app/models/newsinfo.dart';
import 'package:hello_app/utils/utility.dart';

class ProductBox extends StatelessWidget {
  ProductBox({required this.item});

  final Article item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        child: Card(
            elevation: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      new GestureDetector(

                        onTap: () {
                          alertDialog(context, "dummy", item.description);
                        },
                        child: Image.asset('assets/images/pixel.jpg'),
                      ),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: <Widget>[
                                  new GestureDetector(
                                      onTap: () {
                                        alertDialog(context, "text",
                                            item.title);
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(this.item.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),

                                      )),
                                  Text(this.item.description, maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                  Text(
                                    "Price: " + this.item.content, maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                ],
                              )))
                    ]))));
  }
}
