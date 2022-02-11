import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoicing_app/modules/invoice.dart';

import '../shared/components.dart';

class Products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductsState();
}

class ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 100,
        height: 50,
        child: FloatingActionButton(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Invoice()));
          },
          child: Text(
            "Go to Bill ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(children: [
          ProductItem(
              text: "New Black T-shirt",
              image:
                  "https://th.bing.com/th/id/R.fd2a421a610672b0db2dc588f57f0e93?rik=q4BiuLw3l7ha1Q&pid=ImgRaw&r=0",
              price: 300,
              context: context),
          ProductItem(
              text: "Pink T-shirt",
              image:
                  "https://th.bing.com/th/id/OIP.iMG2sapghCUooWiWmT35DgHaHa?pid=ImgDet&rs=1",
              price: 250,
              context: context),
          ProductItem(
              text: "Short dress",
              image:
                  "https://th.bing.com/th/id/OIP.xUOrJqLDz310kbPcyq5VcAHaLH?pid=ImgDet&rs=1",
              price: 500,
              context: context)
        ]),
      ),
      // ListView.separated(
      //     physics: BouncingScrollPhysics(),
      //     //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
      //     itemBuilder: (context, index) =>
      //         ProductItem(context),
      //     separatorBuilder: (context, index) => Container(
      //       width: double.infinity,
      //       height: 0,
      //       color: Colors.grey,
      //     ),
      //     itemCount: 20),
    );
  }
}
