import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_crud/view/gallery_points.dart';
import 'package:flutter_crud/view/locationInput.dart';

class Pointspage extends StatefulWidget {
  const Pointspage({Key key}) : super(key: key);

  @override
  State<Pointspage> createState() => _PointspageState();
}

class _PointspageState extends State<Pointspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pontos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          LocationInput(),
          Text(
            "Ponto A",
            style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(labelText: "nome"),
          ),
          SizedBox(height: 20),
          Expanded(
              child: TextField(
            autocorrect: true,
            maxLines: null, //wrap text
            autofocus: true,
            cursorColor: Colors.purple[900],
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Notas e pensametos',
            ),
          )),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('adicionar')),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  label: Text('delete'))
            ],
          ),
          SizedBox(height: 20),
          Gallery(),
        ]),
      ),
    );
  }
}
