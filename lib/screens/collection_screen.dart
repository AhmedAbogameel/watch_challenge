import 'package:challenge6/screens/product_details_screen.dart';
import 'package:challenge6/widgets/app_bar.dart';
import 'package:challenge6/widgets/bottom_navigation_bar.dart';
import 'package:challenge6/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CustomAppBar(),
        ),
        drawer: Drawer(),
        body: Stack(
          children: <Widget>[
            Positioned(
              //top: 5,
                left: 30,
                child: Text('The Collection',style: TextStyle(fontSize: 30,color: theme.primaryColor,fontWeight: FontWeight.bold),)),
            GestureDetector(
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context , index)=> Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50,right: 20,top: 100,bottom: 150),
                      child: ProductCard(),
                    ),
                    Positioned(left:25,right: 1,top: 15,child: Image.asset('images/watch.png',height: MediaQuery.of(context).size.width / 1.2,),),
                  ],
                ),
              ),
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsScreen())),
            ),
            CustomNavigationBar(_currentIndex),
          ],
        ),
      ),
    );
  }
}
