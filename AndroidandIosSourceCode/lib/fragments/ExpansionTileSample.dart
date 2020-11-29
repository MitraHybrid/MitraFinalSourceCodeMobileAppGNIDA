import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';

class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mitra'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
              itemCount: data.length,
        ),
    
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'FAQ',
    <Entry>[
       Entry(
        Faq.citizenService,
        <Entry>[
          Entry(Faq.citizenservicedetail,),
        ],
      ),
      Entry(
        Faq.serviceavilable,
        <Entry>[
          Entry(Faq.servicedetails),
        ],
      ),
       Entry(
        Faq.gpslocation,
        <Entry>[
          Entry(Faq.gpsdetails),
        ],
      ),
      Entry(
        Faq.pollutioncomplaint,
        <Entry>[
          Entry(Faq.pollutiondetails),
        ],
      ),
       Entry(
        Faq.usenamePassword,
        <Entry>[
          Entry(Faq.usernamedetails),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,style:TextStyle(fontWeight: FontWeight.bold),),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
