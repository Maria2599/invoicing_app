import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:invoicing_app/shared/constants.dart';

import '../shared/components.dart';

class Invoice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InvoiceState();
}

class InvoiceState extends State<Invoice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    num sum = 0;

    print(Cart.length);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 22.0, left: 10),
          child: Text(
            "Invoice",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: Text(
            DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()).toString(),
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: Text(
            "User Name: $emailConst",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: (BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
                color: Colors.white,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Items: ",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                sum += Cart[index].elementAt(2);
                                total = sum;
                                print(sum);

                                return ProductItemInvoice(Cart, index, context);
                              },
                              separatorBuilder: (context, index) => Container(
                                    width: double.infinity,
                                    height: 0,
                                    color: Colors.grey,
                                  ),
                              itemCount: Cart.length),
                        ),
                        Center(
                          child: Text(
                            "Total: $total LE",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
