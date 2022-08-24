import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(homepage());
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var textctrl=TextEditingController();
  String text = "";
  String? fct;
  Future<String> getData(String num) async {
    //make req
    http.Response rspns = await http.get(
        Uri.parse("http://numbersapi.com/$num"));

    String Data = rspns.body;
    return Data;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(
          title: Text(
            "Random Numbers",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic,
                fontSize: 24.0
            ),
          ),
          elevation: 12.0,
          backgroundColor: Colors.red[500],
        ),
        body: Container(
          child: Column(
            children: [
              TextFormField(
                controller: textctrl,
                keyboardType: TextInputType.number,

              ),
              IconButton(
                  onPressed: () async{
                    text = textctrl.text;
                    fct= await getData(text);
                    setState(() {});
                  },
                  icon: Icon(Icons.check)),
              Card(
                color: Colors.orange,
                elevation: 5,
                //shape: ShapeBorder(),
                child: Text(
                  "You entered : $text\n Your fact: ${
                  fct ??  ""
                  }",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

