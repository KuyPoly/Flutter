import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Button(),
              SizedBox(height: 15,),
              Button(),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    ));

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSelected = false;
  String get texts => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get bgColor => isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  void selection(){
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                    onPressed: selection,
                    style: ElevatedButton.styleFrom(backgroundColor: bgColor),
                    child: Center(
                      child: Text(
                        texts,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    )),
              );
  }
}