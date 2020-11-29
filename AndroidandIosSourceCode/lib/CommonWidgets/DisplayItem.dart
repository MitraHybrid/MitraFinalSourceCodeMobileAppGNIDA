

import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';


class Display {
  Display( this.image ,this.title, [this.children = const <Display>[]]);
   Icon image;
   String title;
   List<Display> children;
}

// The entire multilevel list displayed by this app.
final List<Display> data = <Display>[
  Display(null,
    'Contant Details',
    <Display>[
       Display(
        Icon(Icons.location_on),
        ContantDetails.emailId,
        <Display>[
          Display(null,"authority@gnida.com"),
        ],
      ),
      Display(
        null,
        ContantDetails.contantus,
        <Display>[
          Display(null,"0120 233-6002"),
        ],
      ),
    ],
  ),
];


class DisplayItem extends StatelessWidget {

  const DisplayItem(this.entry);
  final Display entry;

  Widget _buildTiles(Display root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Display>(root),
      title: Text(root.title,style:TextStyle(fontWeight: FontWeight.bold),),
      children: root.children.map(_buildTiles).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}