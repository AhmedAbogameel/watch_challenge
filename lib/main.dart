import 'package:challenge6/screens/collection_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

main(){
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => EntryWidget(),
    ),
  );
}

class EntryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        primaryColor: Colors.deepPurple[800],
        accentColor: Colors.deepOrange,
      ),
      home: CollectionScreen(),
    );
  }
}
