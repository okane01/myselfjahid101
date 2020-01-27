import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/loan_receiver_list.dart';
import '../provider/receiver_list.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<LoanReceiver>(
      context,
      listen: false,
    );
    final products = prodData.items;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 320,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) => LoanReceiverWidget(
                products[i].id,
                products[i].name,
                products[i].address,
               // products[i].imageUrl,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: ListTile(
            title: Text(
              'মোট ঋণ গ্রহীতা',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'দেবিপুর-১ \nপায়রাবন্দ, মিঠাপুকুর, রংপুর।',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            trailing: Container(
              child: FlatButton(
                child: Text(
                  '${products.length}',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                color: Colors.grey[800],
                onPressed: null,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[600],
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[200],
                    Colors.grey[300],
                    Colors.grey[400],
                    Colors.grey[500],
                  ],
                  stops: [0.1, 0.3, 0.8, 1],
                ),
              ),
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'ফিল্ড কালেক্টর ঃ মোঃ সবুজ মিয়া, \nপ্রজেক্ট এড়িয়াঃ পায়রাবন্দ, মিঠাপুকুর, রংপুর।'),
          ),
        )
      ],
    );
  }
}
