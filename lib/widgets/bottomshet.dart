import 'package:flutter/material.dart';
import 'package:microcredit/widgets/button.dart';

class BottomSheetWidget extends StatelessWidget {
  final amountEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name: Jahid',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Total Amount: '),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: '500 tk',
          ),
          controller: amountEditingController,
        ),
        SizedBox(
          height: 20,
        ),
        Spacer(),
        Center(
            child: MyButton(
          Icon(Icons.add),
          22,
          null,
        )),
      ],
    );
  }
}
