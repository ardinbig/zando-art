import 'dart:async';

import 'package:flutter/material.dart';

import '/src/models/user.dart';
import '/src/utils/colors.dart';
import 'sign_in_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _message = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _borderRadius = BorderRadius.all(Radius.circular(8.0));

  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            _buildLogo(),
            SizedBox(height: 60.0),
            _buildTextField('Email', _emailController, false),
            SizedBox(height: 9.0),
            _buildTextField('Mot de passe', _passwordController, true),
            SizedBox(height: 15.0),
            _buildButtonBar(),
            SizedBox(height: 40.0),
            _buildSignIn(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 80.0),
        Image.asset('assets/images/logo.png'),
        Text(
          'Zando Art',
          style: Theme.of(context).textTheme.headline,
        ),
      ],
    );
  }

  Widget _buildButtonBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: ZandoSecondaryColor,
            child: Text('Connexion'),
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: _borderRadius),
            onPressed: () {
              _login();
            },
          ),
        )
      ],
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isPassword) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: ZandoMainColor),
      child: TextFormField(
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        obscureText: isPassword,
        cursorColor: ZandoMainColor,
      ),
    );
  }

  Widget _buildSignIn() => FlatButton(
        child: Text("Créer un compte"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        },
      );

  Future<List> _login() async {
    CircularProgressIndicator(
      backgroundColor: Colors.brown,
    );

    // final response = await http.post("http://192.168.43.30:80/zando_art_web/login.php", body: {
    //   "email": _emailController.text,
    //   "password": _passwordController.text,
    // });

    final response;

    var dataUser; //= json.decode(response.body);

    if (dataUser.length == 0) {
      setState(() {
        _message = "Connexion échouée ! ";
        // Fluttertoast.showToast(
        //     msg: _message,
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIos: 1,
        //     backgroundColor: ZandoErrorColor,
        //     textColor: Colors.black,
        //     fontSize: 20.0
        // );
      });
    } else {
      setState(() {
        // user = User();

        // user.id = int.parse(dataUser[0]['id_user']);
        // user.firstname = dataUser[0]['firstname'];
        // user.lastname = dataUser[0]['lastname'];
        // user.city =  dataUser[0]['city'];
        // user.email = dataUser[0]['email'];
        // user.avatar = dataUser[0]['avatar'];
        // user.about = dataUser[0]['about'];

        // Navigator.pushReplacement(context, MaterialPageRoute(
        //     builder: (context) => HomeScreen(user: user,)
        // ));

        // Fluttertoast.showToast(
        //     msg: "Bienvenue ${user.firstname}",
        //     toastLength: Toast.LENGTH_LONG,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIos: 1,
        //     backgroundColor: ZandoSecondaryColor,
        //     textColor: Colors.black,
        //     fontSize: 20.0
        // );
      });
    }

    return dataUser;
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key? key, this.color, this.child})
      : super(key: key);

  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child!,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
