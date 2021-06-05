import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zando_art/src/utils/colors.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = new TextEditingController();
  final _firstPasswordController = TextEditingController();
  final _secondPasswordController = TextEditingController();

  final _borderRadius = BorderRadius.all(Radius.circular(8.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ZandoMainColor,
        title: Text('S\'inscrire'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Zando Art',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 12.0),
            _buildTextField('Nom', _firstNameController, false),
            SizedBox(height: 9.0),
            _buildTextField('Postnom', _secondNameController, false),
            SizedBox(height: 9.0),
            _buildTextField('E-mail', _emailController, false),
            SizedBox(height: 9.0),
            _buildTextField('Mot de passe', _firstPasswordController, true),
            SizedBox(height: 9.0),
            _buildTextField(
                'Vérifaction du mot de passe', _secondPasswordController, true),
            SizedBox(height: 9.0),
            _buildConditions(),
            _buildButtonBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('Annuler'),
          highlightColor: ZandoSecondaryColor,
          shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          onPressed: () {
            _clearField();
          },
        ),
        RaisedButton(
          color: ZandoSecondaryColor,
          child: Text('Inscription'),
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          onPressed: () {
            _addUser();
            _clearField();
            // Fluttertoast.showToast(
            //   msg: "Inscription réussie !",
            //   toastLength: Toast.LENGTH_SHORT,
            //   gravity: ToastGravity.CENTER,
            //   timeInSecForIos: 1,
            //   backgroundColor: ZandoSecondaryColor,
            //   textColor: Colors.black,
            //   fontSize: 20.0
            // );
          },
        ),
      ],
    );
  }

  Widget _buildConditions() {
    return FlatButton(
      child: Text('Conditions d\'utilisation'),
      onPressed: () {},
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isPassword) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: ZandoMainColor),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        obscureText: isPassword,
        cursorColor: ZandoMainColor,
      ),
    );
  }

  _clearField() {
    _firstNameController.clear();
    _secondNameController.clear();
    _emailController.clear();
    _firstPasswordController.clear();
    _secondPasswordController.clear();
  }

  _addUser() {
    var url = "http://192.168.43.30:80/zando_art_web/add_user.php";

    // http.post(url, body: {
    //   "firstname": _firstNameController.text,
    //   "lastname": _secondNameController.text,

    //   /// TODO: Testing if passwords are equals
    //   // "password" : _firstPasswordController.text,

    //   "password" : _firstPasswordController.text,
    //   "email" : _emailController.text,
    // });
  }
}
