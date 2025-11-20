import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            Cards(),
            Cards(),
            Cards(),
            Cards(),
          ],
        ),
      ),
    ));

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool isFavorite = false;
  IconData get iconType => isFavorite ? Icons.favorite : Icons.favorite_border;
  Color get iconColor => isFavorite ? Colors.pink : Colors.grey;

  void favorite(){
    setState(() {
      isFavorite = ! isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: .5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "title",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
                  IconButton(
                    onPressed: favorite, 
                    icon: Icon(
                      iconType,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            );
  }
}
