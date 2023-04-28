import 'package:flutter/material.dart';
import 'package:prectics/Screen/countrymodal.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    CountryModal c1 = ModalRoute.of(context)!.settings.arguments as CountryModal;
    return Scaffold(
      appBar: AppBar(
        title: Text("${c1.l1}",style: TextStyle(
          fontSize: 30,
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("${c1.Images}"),
            SizedBox(height: 10),
            Text("${c1.l1}",style: TextStyle(
                fontSize: 30
            ),),
            SizedBox(height: 10),
            Text("${c1.d2}",style: TextStyle(
                fontSize: 20,
                wordSpacing: 10,
                color: Colors.black
            ),),
          ],
        ),
      ),
    );
  }
}
