import 'package:flutter/material.dart';

import '/src/constants/color.dart';

class UpgradeScreen extends StatefulWidget {
  @override
  _UpgradeScreenState createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promouvoir votre compte"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                _buildTextField(
                    "Email", email, false, false, TextInputType.text),
                SizedBox(height: 9.0),
                _buildTextField("Nom de l'atelier", shopName, false, true,
                    TextInputType.text),
                SizedBox(height: 9.0),
                _buildTextField(
                    "Categorie", category, false, true, TextInputType.text),
                SizedBox(height: 9.0),
                _buildTextField(
                    "Phone", phone, false, true, TextInputType.phone),
                SizedBox(height: 9.0),
                _buildTextField("Adresse complète", address, false, true,
                    TextInputType.text),
                SizedBox(height: 9.0),
                _buildTextField("Description", description, false, true,
                    TextInputType.text),
                SizedBox(height: 9.0),
                _buildButtonBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      bool isPassword, bool enable, TextInputType type) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: ZandoMainColor),
      child: TextField(
        keyboardType: type,
        enabled: enable,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        obscureText: isPassword,
        cursorColor: ZandoMainColor,
      ),
    );
  }

  _clearField() {
    email.clear();
    shopName.clear();
    description.clear();
    phone.clear();
    category.clear();
    address.clear();
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      children: <Widget>[
        TextButton(
          child: Text('Annuler'),
          onPressed: () {
            _clearField();
          },
        ),
        ElevatedButton(
          child: Text('Promouvoir'),
          onPressed: () {
            _upgradeAccount();
            _clearField();
          },
        ),
      ],
    );
  }

  _upgradeAccount() {
    //var url = "http://192.168.43.30:80/zando_art_web/upgrade_account.php";

    // http.post(url, body: {
    //   "email_artist": email.text,
    //   "description": description.text,
    //   "shop_name": shopName.text,
    //   "phone": phone.text,
    //   "category" : category.text,
    //   "full_address" : address.text,
    // });
  }
}
