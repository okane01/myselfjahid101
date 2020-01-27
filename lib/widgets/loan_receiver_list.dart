import 'package:flutter/material.dart';
import 'package:microcredit/widgets/bottomshet.dart';
import '../widgets/buttontapped.dart';

class LoanReceiverWidget extends StatelessWidget {
  LoanReceiverWidget(
    this.id,
    this.name,
    this.address,
    // this.imageUrl,
  );

  final String address;
  final String id;
  //final File imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(238, 227, 231, 0.9),
          Color.fromRGBO(72, 177, 191, 0.3),
        ])),
        child: ListTile(
          leading: CircleAvatar(
              // backgroundImage: FileImage(imageUrl),
              ),
          title: Text(name),
          subtitle: Text(
            address,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: Container(
            width: 105,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonTapped(Icon(Icons.add), 16, () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => AnimatedContainer(
                      duration: Duration(seconds: 5),
                      curve: Curves.easeIn,
                      child: BottomSheetWidget(),
                    ),
                  );
                }),
                ButtonTapped(Icon(Icons.save), 16, () {}),
                ButtonTapped(Icon(Icons.delete), 16, () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
