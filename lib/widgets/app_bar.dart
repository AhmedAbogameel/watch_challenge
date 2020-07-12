import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool back;
  CustomAppBar({this.back = false});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Builder(
      builder: (ctx)=> AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(top : 8.0,left: 12),
          child: IconButton(
              icon: Icon(
                !back ? Icons.menu : Icons.arrow_back,
                color: !back ? theme.primaryColor : Colors.white,
                size: 35,
              ),
              onPressed: ()=> !back ? Scaffold.of(ctx).openDrawer() : Navigator.pop(context)),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top : 8.0,right: 12.0),
                child: IconButton(icon: Icon(Icons.local_mall,color: !back ? theme.primaryColor : Colors.white,size: 35,), onPressed: (){}),
              ),
              if(!back)
              Positioned(
                left: 30,
                top: 22,
                child: Icon(Icons.info,color: Colors.red,size: 12,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
