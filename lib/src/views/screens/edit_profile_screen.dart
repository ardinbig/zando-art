import 'package:flutter/material.dart';

import '/src/constants/color.dart';

class EditProfileScreen extends StatefulWidget {
  final String? email;

  EditProfileScreen({this.email});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? idText;
  TextEditingController? firstname;
  TextEditingController? lastname;
  TextEditingController? city;
  TextEditingController? about;

  @override
  void initState() {
    // idText = TextEditingController(text: '$publicId');
    // firstname = TextEditingController(text: publicFirstname);
    // lastname = TextEditingController(text: publicLastname);
    // city = TextEditingController(text: publicCity);
    // about = TextEditingController(text: publicAbout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier le profile"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                _buildTextField("Identifiant", idText!, false, false, 1),
                SizedBox(height: 9.0),
                _buildTextField("Nom", firstname!, false, true, 1),
                SizedBox(height: 9.0),
                _buildTextField("Postnom", lastname!, false, true, 1),
                SizedBox(height: 9.0),
                _buildTextField("Ville", city!, false, true, 1),
                SizedBox(height: 9.0),
                _buildTextField("A propos de vous", about!, false, true, 2),
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
      bool isPassword, bool enable, int max) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: ZandoMainColor),
      child: TextField(
        maxLines: max,
        enabled: enable,
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        obscureText: isPassword,
        cursorColor: ZandoMainColor,
      ),
    );
  }

  _clearField() {
    firstname!.clear();
    lastname!.clear();
    city!.clear();
    about!.clear();
    idText!.clear();
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
          child: Text('Modifier'),
          onPressed: () {
            _editProfile();
            _clearField();
          },
        ),
      ],
    );
  }

  _editProfile() {
    //var url = "http://192.168.43.30:80/zando_art_web/edit_user.php";

    // http.post(url, body: {
    //   "id_user" : idText.text,
    //   "firstname": firstname.text,
    //   "lastname": lastname.text,

    //   // "password" : _firstPasswordController.text,

    //   "city" : city.text,
    //   "about" : about.text,
    // });
  }
}
