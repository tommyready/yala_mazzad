import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username;
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildLogo(size),
              buildInputField("Username", true),
              buildInputField("Password", false),
              buildInputField("Email", true),
              buildSignUpButton(size),
              buildLoginText(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogo(Size size) {
    return Container(
      child: Image.asset(
        "img/mazzad.png",
        height: size.height / 4,
        width: size.width / 2,
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Widget buildInputField(String fieldName, bool visible) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 15),
      child: TextField(
        obscureText: !visible,
        onChanged: (text) {
          setState(() {
            if ( fieldName == "Username" )
              this.username = text;
            else if ( fieldName == "Password" )
              this.password = text;
            else
              this.email = text;
          });
        },
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            labelText: fieldName,
            hintText: fieldName,
            hintStyle: TextStyle(fontSize: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
        ),
      ),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
    );
  }

  Widget buildSignUpButton(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape: StadiumBorder(),
        color: Colors.pinkAccent,
        splashColor: Colors.green,
        padding: EdgeInsets.fromLTRB(size.width / 8, 15, size.width / 8, 15),
      ),
    );
  }

  Widget buildLoginText(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Already Have an account, "),
          InkWell(
            child: Text(
              "Login from here.",
              style:
              TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
      ),
    );
  }
}