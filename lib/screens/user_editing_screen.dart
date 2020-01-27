import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:microcredit/model/person_model.dart';
import 'package:microcredit/provider/receiver_list.dart';
import 'package:provider/provider.dart';
import '../widgets/button.dart';

class UserEditingScreen extends StatefulWidget {
  static const routeName = '/user-editing';
  @override
  _UserEditingScreenState createState() => _UserEditingScreenState();
}

class _UserEditingScreenState extends State<UserEditingScreen> {
  final _form = GlobalKey<FormState>();
  File _storedImage;  
  var _editedPerson = Person(
    id: null,
    name: '',
    address: '', 
  );
  var _initValue = {
    'name': '',
    'address': '',
    'imageUrl': '',
  };
  void _saveForm() {
    _form.currentState.save();
    Provider.of<LoanReceiver>(context).addProduct(_editedPerson);
  }

  Future<void> _picImage() async {
  final File _newImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      // maxWidth: 2100,
    );
    setState(() {
      _storedImage = _newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ঋণ গ্রহীতার তথ্য',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Container(
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                     // width: 140,
                      child: TextFormField(
                        initialValue: _initValue['name'],
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(labelText: 'নাম'),
                        onSaved: (value) {
                          _editedPerson = Person(
                            name: value,
                            address: _editedPerson.address,
                            //imageUrl: _editedPerson.imageUrl,
                            id: null,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Stack( 
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: _storedImage == null
                                ? Icon(
                                    Icons.folder_open,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    child: Image.file(
                                      _storedImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.folder_open,
                          ),
                          onPressed: _picImage,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: _initValue['address'],
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 10,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'ঠিকানা',
                  ),
                  onSaved: (value) {
                    _editedPerson = Person(
                      name: _editedPerson.name,
                      address: value,
                     // imageUrl: _editedPerson.imageUrl,
                      id: null,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'মোবাইল নং',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'টাকার পরিমান',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'জাতীয় পরিচয় পত্রের কপি',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'স্বাক্ষীর নাম'),
                ),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                  Icon(Icons.save),
                  24,
                  _saveForm,
                ),
              ],
            ),
          ),
        ),
      ),
      // persistentFooterButtons: <Widget>[
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     mainAxisSize: MainAxisSize.max,
      //     children: <Widget>[
      //       MyButton(Icon(Icons.home), 16, () {
      //         Navigator.of(context).pushNamed('/');
      //       }),
      //       MyButton(Icon(Icons.add_shopping_cart), 16, () {}),
      //       MyButton(Icon(Icons.adjust), 16, () {}),
      //       MyButton(Icon(Icons.portrait), 16, () {
      //         Navigator.of(context).pushNamed(
      //           UserEditingScreen.routeName,
      //         );
      //       }),
      //     ],
      //   )
      // ],
    );
  }
}
