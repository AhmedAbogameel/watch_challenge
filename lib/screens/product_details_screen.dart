import 'dart:async';
import 'package:challenge6/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color color = Colors.brown[900];
  Timer _timer;
  int pageIndex = 0;
  double carouselPosition = 0;
  PageController _controller = PageController();
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      _timer = Timer.periodic(Duration(seconds: 5), (timer) {
        setState(() {
          pageIndex ++;
        });
        _controller.animateToPage(pageIndex, duration: Duration(seconds: 5), curve: Curves.bounceInOut);
        if(pageIndex == 9)timer.cancel();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
      backgroundColor: color,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(
          back: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 300,
                  child: PageView(
                    controller: _controller,
                    children: pageChildren,
                    onPageChanged: (value) {
                      if (pageIndex > value) {
                        setState(() {
                          carouselPosition -= 35;
                        });
                      } else {
                        if (value < 10) {
                          setState(() {
                            carouselPosition += 35;
                          });
                        }
                      }
                      pageIndex = value;
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: colorButtons,
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: 10,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Positioned(
                left: carouselPosition,
                child: Container(
                  height: 10,
                  width: 35,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Heritage 1921\nBrown Lether Strap',
                    style: TextStyle(
                        fontSize: 30,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'US \$199.89',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'This watch is nine-millimeters in thickness, forty millimeters in diameter, with a 316-L polished case.\nThe dial texture is a Clous Paris piece.',
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'MOVEMENT',
                    style:
                        TextStyle(color: theme.primaryColor.withOpacity(0.3)),
                  ),
                  Text(
                    'Japanese Quartz Movement',
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.star,
                            color: Colors.brown[900],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.brown[900]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            child: Center(
                                child: Text(
                              'ADD TO CART',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                              color: Colors.brown[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  List<Widget> pageChildren = [
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
    Image.asset(
      'images/watch.png',
      height: 350,
    ),
  ];
  Widget buildColorButton(colorX) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: colorX,
      ),
      onTap: () {
        setState(() {
          color = colorX;
        });
      },
    );
  }
}
