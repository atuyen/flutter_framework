import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../study_screen.dart';





// MyApp is a StatefulWidget. This allows us to update the state of the
// Widget whenever an item is removed.
class KeyDismiss extends StatefulWidget {
  KeyDismiss({Key key}) : super(key: key);

  @override
  KeyDismissState createState() {
    return KeyDismissState();
  }
}

class KeyDismissState extends State<KeyDismiss> {
  final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed:()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>StudyScreen()), (_)=>false),
        ),
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify Widgets.
              // 如果这里使用相同的KEY，将导致重新build时候，在rendertree中无法找到对应的widget，因为widgt的key值一样，无法知道哪个是要被删除的。
              //如果不使用KEY，则报错key == null，使用dismissible必须有key
              key: Key(item),
              // We also need to provide a function that tells our app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from our data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar!
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away
              background: Container(color: Colors.red),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}