import 'dart:io';

import 'package:flutter/material.dart';

import '../model/person_model.dart';

class LoanReceiver with ChangeNotifier{
  List<Person> _items = [
    // Person(
    //   id: 'a1',
    //   name: 'জাহিদ',
    //   address: 'দেবিপুর, পায়রাবন্দ, মিঠাপুকুর,রংপুর।',
    //  // imageUrl: null,
    //   //imageUrl: 'https://i.postimg.cc/j2x3hH0B/1.jpg',
    // ),
    // Person(
    //   id: 'a2',
    //   name: 'সজিব',
    //   address: 'দেবিপুর, পায়রাবন্দ, মিঠাপুকুর,রংপুর।',
    //   //imageUrl: null,
    //   //imageUrl: 'https://i.postimg.cc/vBB6LT23/2.jpg',
    // ),
    // Person(
    //   id: 'a3',
    //   name: 'সাইদি',
    //   address: 'দেবিপুর, পায়রাবন্দ, মিঠাপুকুর,রংপুর।',
    //   //imageUrl: null,
    //   //imageUrl: 'https://i.postimg.cc/D01smDMT/3.jpg',
    // ),
    // Person(
    //   id: 'a4',
    //   name: 'সাহিদুল',
    //   address: 'দেবিপুর, পায়রাবন্দ, মিঠাপুকুর,রংপুর।',
    //   //imageUrl: null,
    //   //imageUrl: 'https://i.postimg.cc/YSVmRMc7/4.jpg',
    // ),
    // Person(
    //   id: 'a5',
    //   name: 'পলাশ',
    //   address: 'দেবিপুর, পায়রাবন্দ, মিঠাপুকুর,রংপুর।',
    //   //imageUrl: null,
    //  // imageUrl: 'https://i.postimg.cc/02xKcV4z/5.jpg',
    // ),
    // Person(
    //   id: 'a6',
    //   name: 'রতন',
    //   address: 'দেবিপুর, পায়রাবন্দ, মিঠাপুকুর,রংপুর।',
    //   //imageUrl: null,
    //   //imageUrl: 'https://i.postimg.cc/qRygGKXc/6.jpg',
    // ),
  ];

  List<Person> get items {
    return [..._items];
  }

  void addProduct (String pickedName,String pickedAddress, File pickedImage){
    final _updatedPersons = Person(
      id: DateTime.now().toString(),
      name: pickedName,
      imageUrl: pickedImage,
      address: pickedAddress,
    );

   _items.add(_updatedPersons);
   notifyListeners();
  }
}