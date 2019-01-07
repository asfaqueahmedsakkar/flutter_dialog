# flutter_dialog

A new Flutter for dialog

## Getting Started
To use this package import it as 
 ```dart
  import 'package:flutter_dialog/flutter_dialog.dart';
```

To show the dialog inside an screen or widget wrap that with ``FlutterDialog`` widget and provide other parameters,
 ```dart
 FlutterDialog(
         child: MyHomePage(title: 'Flutter Dialog Text'),
         blueAmount: 2.0,
         cancelable: true,
       ),
```

then inside My homepage get the ``FlutterDialog`` using 
 ```dart
 flutterDialog = context.ancestorWidgetOfExactType(FlutterDialog);
```

then show the dialog only with Title , Content and Action use
 ```dart
     void _showDialog() {
         flutterDialog.showDialog(
           title: Text(
             "Fluttr Dialog test",
             style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.w600,
               fontSize: 22.0,
             ),
           ),
           content: Text(
             "Fluttr Dialog test",
             style: TextStyle(
               color: Colors.black,
               fontSize: 16.0,
             ),
           ),
         );
       }
```

To show a Custom dialog use this as 
 ```dart
 void _showCustomDialog() {
     flutterDialog.showCustomDialog(
       dialog: Row(
         children: <Widget>[
           Container(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   "Fluttr Dialog test",
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w600,
                     fontSize: 22.0,
                   ),
                 ),
                 Text(
                   "Fluttr Dialog test",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 16.0,
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     );
   }
```