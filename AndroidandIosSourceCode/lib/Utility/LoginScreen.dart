import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              AppButton(
                width: size.width * 0.7,
                height: size.height * 0.1,
                onPressed: this._onPressed,
                title: 'Some Name',
              ),
              AppButton(
                width: size.width * 0.7,
                height: size.height * 0.1,
                onPressed: this._onPressed,
                title: 'Some Name',
              ),
              AppButton(
                width: size.width * 0.7,
                height: size.height * 0.1,
                onPressed: this._onPressed,
                title: 'Some Name',
              )
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {}
}
