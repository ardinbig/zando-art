import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'inscrire"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14.0),
          child: SignUpForm(),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'signup-form');

  // Map<String, dynamic> _data = {
  //   'name': '',
  //   'secondName': '',
  //   'email': '',
  //   'password': '',
  // };

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
          Container(
            margin: const EdgeInsets.all(14.0),
            child: CircleAvatar(
              radius: 20.0,
            ),
          ),
          _buildTextFormField(
            label: 'Prénom',
            onChanged: (value) {},
          ),
          const SizedBox(height: 8.0),
          _buildTextFormField(
            label: 'Postnom',
            onChanged: (value) {},
          ),
          const SizedBox(height: 8.0),
          _buildTextFormField(
            label: 'E-mail',
            onChanged: (value) {},
          ),
          const SizedBox(height: 8.0),
          _buildTextFormField(
            label: 'Mot de passe',
            onChanged: (value) {},
          ),
          const SizedBox(height: 8.0),
          _buildTextFormField(
            label: 'Mot de passe',
            onChanged: (value) {},
          ),
          const SizedBox(height: 8.0),
          TextButton(
            child: const Text("Conditions d'utilisation"),
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Inscription'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
