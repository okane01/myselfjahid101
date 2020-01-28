import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/receiver_list.dart';
import '../widgets/image_input.dart';
import '../widgets/button.dart';

class UserEditingScreen extends StatefulWidget {
  static const routeName = '/user-editing';
  @override
  _UserEditingScreenState createState() => _UserEditingScreenState();
}

class _UserEditingScreenState extends State<UserEditingScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _form = GlobalKey<FormState>();
  File pickedImage;
  void selectImage(File image) {
    pickedImage = image;
  }

  void onSavedData() {
    if (_nameController.text.isEmpty ||
        _addressController.text.isEmpty ||
        pickedImage == null) {
      return;
    }
    Provider.of<LoanReceiver>(context, listen: false)
        .addProduct(_nameController.text, _addressController.text, pickedImage);
    Navigator.of(context).pop();
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
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(labelText: 'নাম'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CameraWidget(selectImage),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 10,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'ঠিকানা',
                  ),
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
                  onSavedData,
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
