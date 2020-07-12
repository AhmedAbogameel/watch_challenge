import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar(this.currentIndex);
  int currentIndex;
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          elevation: 50,
          backgroundColor: Colors.grey.withOpacity(0.2),
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: CircleAvatar(
                child: Icon(
                  Icons.home,
                  color: getIconTheme(0, theme).color,
                  size: getIconTheme(0, theme).size,
                ),
                backgroundColor: widget.currentIndex == 0 ? theme.primaryColor : Colors.grey.withOpacity(0.01),              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                child: Icon(
                  Icons.search,
                  color: getIconTheme(1, theme).color,
                  size: getIconTheme(1, theme).size,
                ),
                backgroundColor: widget.currentIndex == 1 ? theme.primaryColor : Colors.grey.withOpacity(0.01),
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  child: Icon(
                    Icons.photo,
                    color: getIconTheme(2, theme).color,
                    size: getIconTheme(2, theme).size,
                  ),
                  backgroundColor: widget.currentIndex == 2 ? theme.primaryColor : Colors.grey.withOpacity(0.01),
                ),
                title: Container()),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                child: Icon(
                  Icons.star_border,
                  color: getIconTheme(3, theme).color,
                  size: getIconTheme(3, theme).size,
                ),
                backgroundColor: widget.currentIndex == 3 ? theme.primaryColor : Colors.grey.withOpacity(0.01),
              ),
              title: Container(),
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: getIconTheme(4, theme).color,
                    size: getIconTheme(4, theme).size,
                  ),
                  backgroundColor: widget.currentIndex == 4 ? theme.primaryColor : Colors.grey.withOpacity(0.01),
                ),
                title: Container(),
            ),
          ],
        ),
      ),
    );
  }

  IconThemeData getIconTheme(int index, theme) {
    return IconThemeData(
      size: widget.currentIndex == index ? 30 : 22,
      color: widget.currentIndex == index ? Colors.white : theme.primaryColor,
    );
  }
}
