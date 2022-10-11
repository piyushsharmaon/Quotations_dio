import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quotations_rest_api/quotesjson.dart';
import '../responsemodal.dart';
class Quotespage extends StatefulWidget {
  const Quotespage({Key? key}) : super(key: key);

  @override
  State<Quotespage> createState() => _QuotespageState();
}

class _QuotespageState extends State<Quotespage> {
  quotesjson? myData;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchPost().then((value) {
        myData=value;
        setState(() {

        });

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return Scaffold(body: Center(
      child: Expanded(child: ListView.builder(
      shrinkWrap: true,
      itemCount: myData?.quotes?.length ?? 0,
          itemBuilder: (context, index) {
        Quotes? item = myData?.quotes![index];
        return Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height/7,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height/25,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey,
              alignment: Alignment.topLeft,
              child: Text((
          "${item?.id.toString() ?? ""}"),
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
          ),
            ),
            Container(
              child: Expanded(
                child: Text((
                    "${item?.quote.toString() ?? ""}"),
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text((
                  "${item?.author.toString() ?? ""}"),
                style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),

          ],),
        ); })),
    ));
  }
  }
