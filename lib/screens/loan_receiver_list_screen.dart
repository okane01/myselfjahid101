import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/product_items.dart';
import '../screens/user_editing_screen.dart';

class LoanReceiverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            'ঋণ গ্রহীতা',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    UserEditingScreen.routeName,
                  );
                },
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey[600],
                //       offset: Offset(4.0, 4.0),
                //       blurRadius: 15.0,
                //       spreadRadius: 1.0),
                //   BoxShadow(
                //       color: Colors.white,
                //       offset: Offset(-4.0, -4.0),
                //       blurRadius: 15.0,
                //       spreadRadius: 1.0),
                // ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(238, 227, 231, 0.9),
                    Color.fromRGBO(72, 177, 191, 0.3),
                  ],
                  stops: [0.1, 1],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ProductItem(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyButton(Icon(Icons.home), 16, () {
                    Navigator.of(context).pushNamed('/');
                  }),
                  MyButton(Icon(Icons.add_shopping_cart), 16, () {}),
                  MyButton(Icon(Icons.adjust), 16, () {}),
                  MyButton(Icon(Icons.portrait), 16, () {
                    Navigator.of(context).pushNamed(
                      UserEditingScreen.routeName,
                    );
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
