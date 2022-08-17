import 'package:bill1/Mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    TableRow _tablerow = TableRow(
      children: [
        Padding(padding: EdgeInsets.all(4),
        child:Text("Index") ),
        Padding(padding: EdgeInsets.all(4),
            child:Text("Item name") ),
        Padding(padding: EdgeInsets.all(4),
            child:Text("Quantity",style: TextStyle(
              fontSize: 12
            ),) ),
        Padding(padding: EdgeInsets.all(4),
            child:Text("Unit") ),Padding(padding: EdgeInsets.all(4),
            child:Text("Price/ Unit") ),
        Padding(padding: EdgeInsets.all(4),
            child:Text("Gst") ),
        Padding(padding: EdgeInsets.all(4),
            child:Text("Amount",style: TextStyle(
              fontSize: 12
            ),) ),
       
      ]
    );
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("My Company",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Text("Phone NO: 1234567890"),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),     
            Text("Tax Invoice",style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("Bill To:",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                Row(
                  children: [
                    Text(" Kris Patel"),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 180)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Date:  /  /  /")
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text("Phone NO: 1234567890"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(

              child: Center(
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    _tablerow,
                    _tablerow,
                    _tablerow,
                    _tablerow,
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Sub Total"),
                      SizedBox(
                        width: 50,
                      ),
                      Text("............................."),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Gst Tax%"),
                      SizedBox(
                        width: 50,
                      ),
                      Text("............................."),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 50,
                      ),
                      Text("............................."),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Recrived"),
                      SizedBox(
                        width: 50,
                      ),
                      Text("............................."),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Balance"),
                      SizedBox(
                        width: 50,
                      ),
                      Text("............................."),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Print" )),
            ElevatedButton(onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainPage()), (route) => false);
            }, child: Text("Logout" ))
          ],
        ),
      ),
    );
  }

}
