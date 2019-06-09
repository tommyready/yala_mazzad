import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Omar Hatem"),
              accountEmail: Text("Omar@gmail.com"),
              currentAccountPicture: Image.asset("img/mazzad.png"),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Login"),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("SignUp"),
              onTap: () => Navigator.pushNamed(context, '/signUp'),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }
}
