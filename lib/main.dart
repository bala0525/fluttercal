import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
Widget build(BuildContext context){
    return MaterialApp(
      title: "ole punda",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget{
  @override
  _HomePageState createState() =>_HomePageState();

}

class _HomePageState extends State<Homepage>{
late int first, second;
late String opp;
late String result, text = "";
  void btnClicked(String btnText){
 if (btnText == "C"){
   print("case 1");
   result = "";
   text ="";
first =0;
second=0;
 }else if(btnText == "+"||btnText == "-"||btnText == "x"||btnText == "/"){
   print("case 2");
   first = int.parse(text);
   result="";
   opp = btnText;

 }else if(btnText == "="){
   print("case 3");
   second= int.parse(text);
   if(opp == "+"){
     result = (first+second).toString();
   }else if(opp == "-"){
    result = (first-second).toString();
    }
   else if(opp == "x"){
     result = (first*second).toString();
   }
   else if(opp == "/"){
     result = (first~/second).toString();
   }
 }else{
   print("case 4");
    result = int.parse(text + btnText).toString();
 }
setState(() {
  text = result;
});
  }

 Widget customOutlineButton(String value ){
   return OutlinedButton(onPressed: ()=> btnClicked(value),

       child: Text(
         value,
         style: TextStyle(fontSize: 25),
       ));


 }

  @override
  Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(title: Text("calculator")),
  body: Container(
    child: Column(
      children: [
        Expanded(child: Container(
          color: Colors.orange,
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
       child: Text(
         text,
         style: TextStyle(
           fontSize: 50,
           fontWeight: FontWeight.w600,
           color: Colors.red
         ),
       ),
        )),
        Row(children: [
          customOutlineButton("9"),
          customOutlineButton("8"),
          customOutlineButton("7"),
          customOutlineButton("+"),
        ],),
        Row(children: [
          customOutlineButton("6"),
          customOutlineButton("5"),
          customOutlineButton("4"),
          customOutlineButton("-"),
        ],),
        Row(children: [
          customOutlineButton("3"),
          customOutlineButton("2"),
          customOutlineButton("1"),
          customOutlineButton("x"),
        ],),
        Row(children: [
          customOutlineButton("C"),
          customOutlineButton("0"),
          customOutlineButton("="),
          customOutlineButton("/"),
        ],)


      ] ,
    ),
  ),
  );
  }
}