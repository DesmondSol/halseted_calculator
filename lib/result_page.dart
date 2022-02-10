// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';

// // consider converting to stateful widget if stg is not working
// class ResultPage extends StatefulWidget {
// //  const NewTransaction({ Key? key }) : super(key: key);
 
//   @override
//   ResultPageState createState() => ResultPageState();
// }

// class ResultPageState extends State<NewTransaction> {
//   final _titleController = TextEditingController();
//   final _amountContoller = TextEditingController();
//   DateTime _selectedDate = DateTime.now();


//     final enteredTitle = _titleController.text;
//     final enteredAmnt = double.parse(_amountContoller.text);
//     // addtx(titleController.text,  // another way of putting it
//     // double.parse(amountContoller.text)

//       // Fluttertoast.showToast(
//       //     msg: "please enter realistic values",
//       //     toastLength: Toast.LENGTH_SHORT,
//       //     gravity: ToastGravity.CENTER,
//       //     timeInSecForIosWeb: 1,
//       //     backgroundColor: Colors.red,
//       //     textColor: Colors.white,
//       //     fontSize: 16.0);
     
    
//     // widget.addtx(enteredTitle, enteredAmnt, _selectedDate);
//     Navigator.of(context).pop();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             Container(
//               child: Center(
//                 child: Text(
//                   'Income',
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     color: Colors.lightGreen,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             TextField(
//               controller: _titleController,
//               //     onChanged: (val) => ttlInput = val,
//               onSubmitted: (_) => _submitData(),
//               decoration: InputDecoration(labelText: "Title"),
//             ),
//             TextField(
//               controller: _amountContoller,
//               //onSubmitted: (_) => _submitData(),

//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               //      onChanged: (val) => amntInput = val,  is an alternative to thr controller above
//               decoration: InputDecoration(labelText: "Amount"),
//             ),
            
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.lightGreen,
//                     onPrimary: Theme.of(context).textTheme.button.color),
//                 onPressed: _submitData,
//                 child: Text(
//                   'Add Transactions',
//                   //   style: TextStyle(
//                   //       color: Theme.of(context).textTheme.button!.color),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
