import 'package:challenge6/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_indicator/page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color color = Colors.brown[900];
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    List<Widget> colorButtons = [
      buildColorButton(Colors.brown[900]),
      buildColorButton(Colors.pinkAccent),
      buildColorButton(Colors.orange),
      buildColorButton(Colors.grey),
    ];

    return Scaffold(
      backgroundColor:color,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(back: true,),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 30,),
                SizedBox(
                  width: 300,
                  child: PageIndicatorContainer(
                    length: 10,
                    child: PageView(
                      children: <Widget>[
                        Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),Image.asset('images/watch.png',height: 350,),
                      ],
                    ),
                    shape: IndicatorShape.circle(),
                    indicatorSpace: 30,
                    indicatorSelectorColor: color,
                    padding: EdgeInsets.only(bottom: 3),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: colorButtons,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Heritage 1921\nBrown Lether Strap',style: TextStyle(fontSize: 30,color: theme.primaryColor,fontWeight: FontWeight.bold),),
                  Text('US \$199.89',style: TextStyle(fontSize: 20,color: Colors.orange,fontWeight: FontWeight.bold),),
                  Text('This watch is nine-millimeters in thickness, forty millimeters in diameter, with a 316-L polished case.\nThe dial texture is a Clous Paris piece.',style: TextStyle(color: theme.primaryColor,fontSize: 17,fontWeight: FontWeight.w500),),
                  Text('MOVEMENT',style: TextStyle(color: theme.primaryColor.withOpacity(0.3)),),
                  Text('Japanese Quartz Movement',style: TextStyle(color: theme.primaryColor,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.star,color: Colors.brown[900],),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.brown[900]),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 300,
                          child: Center(child: Text('ADD TO CART',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)),
                          decoration: BoxDecoration(
                            color: Colors.brown[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColorButton(colorX){
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: colorX,
      ),
      onTap: (){
        setState(() {
          color = colorX;
        });
      },
    );
  }
}
