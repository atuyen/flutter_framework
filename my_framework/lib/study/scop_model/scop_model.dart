import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


///La 1 thu vien de  giai quyet van de chia se du lieu trong cay widget, thay cho viec su dung inherited widget

///Co 1 state nao do va 1 cay widget nhieu cap : ong ba, cha me, con chau
///Muon chia se state nay trong cay widget
///==>day state do vao 1 model
///Uu diem, chi nhung phan tu nam trong ScopedModelDescendant  va widget con bi rebuild khi state thay doi (loi the so voi setstate)

// ###1. Define a state class, extending from scoped_model.Model.
class _MyState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void incrementCounter() {
    _counter++;
    // Must add notifyListeners() when UI need to be changed.
    // This will notify ALL it's descendants in the widget tree.
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

class ScopedModelExample extends StatelessWidget {
  const ScopedModelExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScopedModel<_MyState>(
          model: _MyState(),
          child: OngBa(),
        ),
      ),
    );
  }
}

class OngBa extends StatefulWidget {
  @override
  _OngBaState createState() => _OngBaState();
}

class _OngBaState extends State<OngBa> {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.blue,
        child: ScopedModelDescendant<_MyState>(
          rebuildOnChange: true,
          builder: (context, child, model) => Column(
            children: <Widget>[
              Text("Counter trong ong ba ${model.counterValue}"),
              Row(
                children: <Widget>[
                  FloatingActionButton(
                    child: Text("++"),
                    onPressed: () {
                      model.incrementCounter();
                    },
                    heroTag: "buton1",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    child: Text("--"),
                    onPressed: () {
                      model.incrementCounter();
                    },
                    heroTag: "buton2",
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ChaMe()
            ],
          ),
        ));
  }
}

class ChaMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.green,
        child: ScopedModelDescendant<_MyState>(
          rebuildOnChange: true,
          builder: (context, child, model) => Column(
            children: <Widget>[
              Text("Counter trong cha me ${model.counterValue}"),
              Row(
                children: <Widget>[
                  FloatingActionButton(
                    child: Text("++"),
                    onPressed: () {
                      model.incrementCounter();
                    },
                    heroTag: "buton1",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    child: Text("--"),
                    onPressed: () {
                      model.incrementCounter();
                    },
                    heroTag: "buton2",
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ConChau()
            ],
          ),
        ));
  }
}

class ConChau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.green,
        child: ScopedModelDescendant<_MyState>(
          rebuildOnChange: true,
          builder: (context, child, model) => Column(
            children: <Widget>[
              Text("Counter trong con cai ${model.counterValue}"),
              Row(
                children: <Widget>[
                  FloatingActionButton(
                    child: Text("++"),
                    onPressed: () {
                      model.incrementCounter();
                    },
                    heroTag: "buton1",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    child: Text("--"),
                    onPressed: () {
                      model.incrementCounter();
                    },
                    heroTag: "buton2",
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
