import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_framework/demo/blocs/main_bloc.dart';
import 'package:provider/provider.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<MainBloc>(context);
    return StreamProvider<int>.value(
      value: bloc.notificationNumberStream,
      initialData: 0,
      child: Consumer<int>(builder: (context, number, child) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: 4,
            ),
            number != null && number != 0
                ? Badge(
              badgeContent: Center(
                child: Container(
                  width: number > 9 ? 20 : 10,
                  height: 10,
                  child: Text(
                    number == 0 ? "" : number.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              position: BadgePosition(right: 0, top: 2),
              badgeColor: Colors.redAccent,
              child: IconButton(
                icon: Image.asset(
                  'res/icons/icon_ring.png',
                  height: 25,
                  width: 25,
                ),
                onPressed: () {},
              ),
            )
                : IconButton(
              icon: Image.asset(
                'res/icons/icon_ring.png',
                height: 25,
                width: 25,
              ),
              onPressed: () {

              },
            ),
          ],
        );
      }),
    );
  }
}
