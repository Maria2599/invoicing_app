import 'package:flutter/material.dart';
import 'package:invoicing_app/shared/constants.dart';

Widget ProductItemInvoice( cart,index,context) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //to make image circular
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image(
              image: NetworkImage(
                cart[index].elementAt(0),
              ),
              width: 100,
              height: 100,
            )),
        SizedBox(
          width: 10,
        ),

        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              cart[index].elementAt(1),
              style: TextStyle(fontSize: 19, color: Colors.black,fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                "${cart[index].elementAt(2)}",
                style: TextStyle(fontSize: 17, color: Colors.blue),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ]),
          ]),
        ),
      ]),
    ),
  );
}

Widget ProductItem({required image,required text,required int price,context}) {
  //print(Cart[2]);
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ////to make image circular
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image(
              image: NetworkImage(
                image,
              ),
              width: 100,
              height: 100,
            )),

        Expanded(
          child:
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
                  text,
                  style: TextStyle(fontSize: 19, color: Colors.black,fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
                  height: 10,
            ),
            Row(children: [
                  Text(
                    "${price}",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    Cart.add({image,text,price});
                    print(Cart);
                // Cart.clear();
                  }, icon: Icon(Icons.shopping_cart),color: Colors.red,)
            ]),
          ]),
                ),
              ),
        ),
      ]),
    ),
  );
}
