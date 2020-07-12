import 'package:challenge6/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.brown[900],
        borderRadius: BorderRadius.circular(50)
      ),
      child: Column(
        children: <Widget>[
          //SizedBox(height: 340,),
          Spacer(flex: 3,),
          Text('Heritage 1921',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 10,),
          Text('Brown Lether Strap',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
          SizedBox(height: 20,),
          Text('US \$199.89',style: TextStyle(color: Colors.amber[700],fontWeight: FontWeight.bold,fontSize: 15),),
          Spacer(),
        ],
      ),
    );
  }
}
