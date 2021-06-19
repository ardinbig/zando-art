import 'package:flutter/material.dart';
import 'package:zando_art/src/constants/color.dart';

class EditArtisteProfileScreen extends StatefulWidget {
  final String? email;

  EditArtisteProfileScreen({this.email});

  @override
  _EditArtisteProfileScreenState createState() =>
      _EditArtisteProfileScreenState();
}

class _EditArtisteProfileScreenState extends State<EditArtisteProfileScreen> {
  TextEditingController? email;
  TextEditingController? shopName;
  TextEditingController? description;
  TextEditingController? phone;
  TextEditingController? category;
  TextEditingController? fullAddress;

  @override
  void initState() {
    // email = TextEditingController(text: '$publicId');
    // shopName = TextEditingController(text: publicFirstname);
    // description = TextEditingController(text: publicLastname);
    // phone = TextEditingController(text: publicCity);
    // category = TextEditingController(text: publicAbout);
    // fullAddress = TextEditingController(text: publicAbout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier le profile"),
        backgroundColor: ZandoMainColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                _buildTextField("Identifiant", email!, false, false),
                SizedBox(height: 9.0),
                _buildTextField("Nom", shopName!, false, true),
                SizedBox(height: 9.0),
                _buildTextField("Postnom", description!, false, true),
                SizedBox(height: 9.0),
                _buildTextField("Ville", phone!, false, true),
                SizedBox(height: 9.0),
                _buildTextField("A propos de vous", category!, false, true),
                SizedBox(height: 9.0),
                _buildButtonBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    bool isPassword,
    bool enable,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: ZandoMainColor),
      child: TextField(
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
    shopName!.clear();
    description!.clear();
    phone!.clear();
    category!.clear();
    email!.clear();
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
    //String url = "http://192.168.43.30:80/zando_art_web/edit_user.php";

    // http.post(Uri(), body: {
    //   "id_user" : email.text,
    //   "firstname": shopName.text,
    //   "lastname": description.text,

    //   // "password" : _firstPasswordController.text,

    //   "city" : phone.text,
    //   "about" : category.text,
    // });
  }
}
