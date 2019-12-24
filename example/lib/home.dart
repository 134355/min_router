import 'package:flutter/material.dart';
import 'package:min_router/min_router.dart';
import 'router.router.dart';


@MinRouter(params: ['title'], navigator: [MinNavigatorType.popUntil,
  MinNavigatorType.pushNamed, MinNavigatorType.popAndPushNamed,
  MinNavigatorType.pushReplacementNamed, MinNavigatorType.pushNamedAndRemoveUntil])
class Home extends StatelessWidget {
  final String title;
  const Home({this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Column(
        children: <Widget>[
          Text(title),
          Text('home页面'),
          InkWell(
            child: Text('hello'),
            onTap: () {
              MinAppRoutes.pop('hello');
            },
          ),InkWell(
            child: Text('world'),
            onTap: () {
              MinAppRoutes.pop('world');
            },
          )
        ],
      ),
    );
  }
}