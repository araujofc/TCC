import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/contactHelper.dart';
import 'locationInput.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact _editedContact;
  bool _userEdited = false;
  final _nameEditContoller = TextEditingController();
  final _emailEditContoller = TextEditingController();
  final _phoneEditContoller = TextEditingController();

  final _nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _nameEditContoller.text = _editedContact.name;
      _emailEditContoller.text = _editedContact.email;
      _phoneEditContoller.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.name ?? "Nova Trilha"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedContact.name != null && _editedContact.name.isNotEmpty) {
              Navigator.pop(context, _editedContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: _editedContact.img != null
                        ? FileImage(File(_editedContact.img))
                        : AssetImage("images/17736.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                final ImagePicker _picker = ImagePicker();
                _picker.pickImage(source: ImageSource.camera).then((file) {
                  if (file == null) return;
                  _editedContact.img = file.path;
                });
              },
            ),
            TextField(
              controller: _nameEditContoller,
              focusNode: _nameFocus,
              decoration: InputDecoration(labelText: "nome"),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  _editedContact.name = text;
                });
              },
            ),
            TextField(
              controller: _emailEditContoller,
              decoration: InputDecoration(labelText: "Contato"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneEditContoller,
              decoration: InputDecoration(labelText: "Telefone"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.phone = text;
              },
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            LocationInput(),
          ]),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("descartar Alterações ?"),
              content: Text("Se sair as alterações serão perdidas!"),
              actions: <Widget>[
                TextButton(
                  child: Text("Cancelar"),
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                ),
                TextButton(
                  child: Text("Sim"),
                  onPressed: (() {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
