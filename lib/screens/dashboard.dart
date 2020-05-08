import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Dashboard extends StatefulWidget {
  final Future<double> fun;
  final Future<double> funs;

  Dashboard(this.fun, this.funs);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _balance,_saving;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: widget.fun,
                    builder: (context, snapshot) {
                      _saving=snapshot.data==null?0:snapshot.data;
                      return Text(snapshot.data == null? "0" :snapshot.data.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.green));
                    }),
                Text("SAVINGS")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: widget.funs,
                    builder: (context, snapshot) {
                      SchedulerBinding.instance
                    .addPostFrameCallback((_) => setState(() {
                    _balance=snapshot.data==null?_saving-0:_saving-snapshot.data;
                      }));
                      return Text(snapshot.data == null? "0" :snapshot.data.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.red));
                    }),
                Text("EXPENSES")
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(_balance.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.greenAccent)),
            Text("balance"),
          ],
        )
      ],
    );
  }
}
