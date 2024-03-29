import 'package:calculator_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = "";
  var answer = "0";

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EZ Calculator Apps By KangIpann",style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white70
      ),),
        backgroundColor: Color(0xff1F1D2B),),
      backgroundColor: Color(0xff1F1D2B),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20,top: 70,left: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                       userInput,
                       style: TextStyle(
                         fontSize:  18,
                         color: Colors.white,
                         fontWeight: FontWeight.w200,
                       ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(right: 15, left: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),

          Expanded(
            flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4
                    ),
                    itemBuilder: (BuildContext context,int index) {
                      //Clear or "C" Button
                      if(index == 0){
                        return MyButton(
                          buttontapped: (){
                            setState(() {
                              userInput = '';
                              answer = '0';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[100],
                          textColor: Colors.black,
                        );
                      }

                      // +/- button
                      else if (index == 1){
                        return MyButton(
                          buttonText: buttons[index],
                          color: Colors.blue[100],
                          textColor: Colors.black,
                        );
                      }
                      // % button
                      else if (index == 2){
                        return MyButton(
                          buttontapped: (){
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[100],
                          textColor: Colors.black,
                        );
                      }

                    //  Delete or Del Button
                      else if (index == 3){
                        return MyButton(
                          buttontapped: (){
                           setState(() {
                             userInput = userInput.substring(0, userInput.length - 1);
                           });
                          },
                          buttonText: buttons[index],
                          color: Colors.red[500],
                          textColor: Colors.black,
                        );
                      }
                    //  Equal to button
                      else if (index == 18){
                        return MyButton(
                          buttontapped: (){
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.orange[700],
                          textColor: Colors.white,
                        );
                      }
                      else {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent
                              : Colors.white,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black,
                        );
                      }
                    }
                ),
              )
          )
        ],
      ),
    );
  }
  bool isOperator(String o){
    if (o == '/' || o == 'x' || o == '-' || o == '+' || o == '='){
      return true;
    }
    return false;
  }
  // function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}



