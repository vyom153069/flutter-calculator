import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
    debugShowCheckedModeBanner: false,

  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";
  buttonPressed(String text){
     if(text=="CLEAR"){
       _output="0";
       num1=0.0;
       num2=0.0;
       operand="";
     }
     else if(text=="+"||text=="-"||text=="/"||text=="X"){
       num1=double.parse(output);
       operand=text;
       _output="0";
     }else if(text=="."){
       if(_output.contains(".")){
         print("Already contains .");
         return;
       }else{
         _output=_output+text;
       }
     }else if(text=="="){
       num2=double.parse(output);
       if(operand=="+"){
         _output=(num1+num2).toString();
       }if(operand=="-"){
         _output=(num1-num2).toString();
       }if(operand=="*"){
         _output=(num1*num2).toString();
       }if(operand=="/"){
         _output=(num1/num2).toString();
       }
       num1=0.0;
       num2=0.0;
       operand="";
     }else{
       _output=_output+text;
     }
     print(_output);
     setState(() {
       output=double.parse(_output).toStringAsFixed(2);
     });
  }
  Widget buildButton(String button){
    return new Expanded(
        child: new OutlineButton(
            padding: EdgeInsets.all(20),
            child: new Text(button,style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            onPressed: ()=>buttonPressed(button)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.red,
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            new Container(
              alignment:Alignment.centerRight,
              child: Container(
                padding:new EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0
                ),
                child: new Text(
                  output,style: new TextStyle(fontSize: 48.0,
                fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new Expanded(
              child: new Divider(),
            ),
            new Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("=")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
