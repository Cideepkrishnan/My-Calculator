import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/view/home_screen/widgets/pop_screen/pop_screen/pop_screen.dart';

import '../../model/button_values/button_values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String number1 = ""; // 0-9
  String number2 = ""; // 0-9
  String operand = ""; // + - * / %
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Pop_screen(),
        ],
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        elevation: 0,
        title: Text(
          "Calculator",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 25,
          )),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // outputs
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "$number1$operand$number2".isEmpty
                        ? "0"
                        : "$number1$operand$number2",
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            )

            // buttons
            ,
            Wrap(
              children: Btn.buttonvalues
                  .map((value) => SizedBox(
                      width: value == Btn.calculate
                          ? screenSize.width / 2
                          : (screenSize.width / 4),
                      height: screenSize.width / 5,
                      child: buildButton(value)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: getBtncolor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
            ),
          ),
        ),
      ),
    );
  }

  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }

    if (value == Btn.clr) {
      clearAll();
      return;
    }
    if (value == Btn.per) {
      convertedToPercentage();
      return;
    }
    if (value == Btn.calculate) {
      calculate();
      return;
    }

    appendValue(value);
  }

//calculate the result
  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);

    var result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;

      case Btn.sub:
        result = num1 - num2;
        break;
      case Btn.mul:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
      default:
    }
    setState(() {
      number1 = "$result";
      if (number1.endsWith(".0")) {
        number1 = number1.substring(0, number1.length - 2);
      }
      operand = "";
      number2 = "";
    });
  }

// converts to percentage
  void convertedToPercentage() {
    // ex:343+444

    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) ;
    {
      // calculate before convertion
      // todo
    }

    if (operand.isNotEmpty) {
      // cannot be conveted
      return;
    }

    final number = double.parse(number1);
    setState(() {
      number1 = "${(number / 100)}";
      operand = "";
      number2 = "";
    });
  }

  // clear all  outputs
  void clearAll() {
    setState(() {
      number1 = "";
      operand = "";
      number2 = "";
    });
  }

// delete one from the end
  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

// append value to the end

  void appendValue(String value) {
    // number1 operand number2
// 234       +     567

// if is operand and not "."
    if (value != Btn.dot && int.tryParse(value) == null) {
      // operand pressed
      if (operand.isNotEmpty && number2.isNotEmpty) {
        // Todo calculate the equation before assigning new operand
        calculate();
      }
      operand = value;
    }
    // assign value to number1 varible
    else if (number1.isEmpty || operand.isEmpty) {
      // check if value is "." || ex:numbe1="1.2"
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && number1.isEmpty || number1 == Btn.n0) {
        // ex:number1 ="" | "0"
        value = "0.";
      }
      number1 += value;
    }
    //  // assign value to number2 varible
    else if (number2.isEmpty || operand.isNotEmpty) {
      // check if value is "." || ex:numbe1="1.2"
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && number2.isEmpty || number2 == Btn.n0) {
        // ex:number1 ="" | "0"
        value = "0.";
      }
      number2 += value;
    }

    setState(() {});
  }

  Color getBtncolor(value) {
    return [Btn.calculate].contains(value)
        ? Color.fromARGB(255, 233, 175, 3)
        : [
            Btn.del,
            Btn.clr,
          ].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.mul,
                Btn.add,
                Btn.divide,
                Btn.sub,
              ].contains(value)
                ? Colors.orange
                : Colors.black87;
  }
}
