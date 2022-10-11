import 'package:flutter/material.dart';
import 'package:quotations_rest_api/Screens/Quotes.dart';
void main() => runApp(MainPage());
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotespage(),
    );
  }
}
