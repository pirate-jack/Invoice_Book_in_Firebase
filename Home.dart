import 'package:bill1/invoicePdf.dart';
import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String dropdownvalue = 'Select';
  var items = [
    'Select',
    'Kg',
    'Gram',
    'Pieces',
    'Carat',
  ];
   String Total = '0';
   String Total1 = '0';
  var sum;
  bool value = true;
  TextEditingController Qty = new TextEditingController();
  TextEditingController Unit = new TextEditingController();
  TextEditingController Tax = new TextEditingController();

  Widget build(BuildContext context) {
    var FTax;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sales",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                Text("Customer Details"),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Customer Name",
                      labelText: "Customer Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Phone Number",
                      labelText: "Phone Number"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("==========================================="),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "* Item *",
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                ),
                Text("==========================================="),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "e.g Product name",
                      labelText: "Item Name"),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: Qty,
                        decoration: InputDecoration(
                            hintText: "Quantity", labelText: "Quantity"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: Unit,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Rate(Price/Unit)",
                            labelText: "Rate(Price/Unit)"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("==========================================="),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Totals & Taxes"),
                  ],
                ),
                Text("==========================================="),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("Subtotal"),
                    Text(
                      " (Rate * Qty)",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  children: [
                    SwitcherButton(
                      onColor: Colors.lightBlue,
                      offColor: Colors.white,
                      value: true,
                      onChange: (value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Tax%"),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: Tax,
                        decoration: InputDecoration(
                          hintText: "%",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Total Amount:= " ,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(Total1,style: TextStyle(
                      fontSize: 20
                    ),),
                  ],
                ),
                ElevatedButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Invoice()));
                }, child: Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
void Gst(F1Tax ){
  setState(() {
    var num1 = int.parse(Total);
    var num2 = int.parse(Tax.text);
    F1Tax = num1%num2;
  });
}
}
