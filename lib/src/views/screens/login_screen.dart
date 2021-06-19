import 'package:flutter/material.dart';

import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    Text(
                      'Zando Art',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'login-form');

  // Map<String, dynamic> _data = {'email': '', 'password': ''};

  Widget _buildTextFormField({
    required String label,
    required void Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return TextFormField(
      obscureText: isPassword,
      onChanged: onChanged,
      autocorrect: false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildTextFormField(
            label: 'E-mail',
            onChanged: (value) {
              // TODO: Submit data
            },
          ),
          const SizedBox(height: 8.0),
          _buildTextFormField(
            label: 'Mot de passe',
            onChanged: (value) {
              // TODO: Submit data
            },
          ),
          ElevatedButton(
            child: const Text('Connexion'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          TextButton(
            child: const Text('Créer un compte'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
