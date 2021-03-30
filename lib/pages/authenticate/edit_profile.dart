import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_app/services/auth.dart';
import 'package:legal_app/services/database.dart';
import '../classes/users.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String title = '';
  String text = '';
  final _form_key1 = GlobalKey<FormState>();
  final _form_key2 = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();
  AuthService auth = new AuthService();
  DatabaseMethods dbMethods = new DatabaseMethods();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _which_image() {
    if (_image == null) {
      return NetworkImage(
          'https://image.shutterstock.com/image-vector/add-image-icon-editable-vector-260nw-1692684598.jpg');
    } else {
      return FileImage(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _which_image(),
                        // image: NetworkImage(
                        //     'https://image.shutterstock.com/image-vector/add-image-icon-editable-vector-260nw-1692684598.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Form(
                    key: _form_key1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[100]),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[100]),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter Title' : null,
                      onChanged: (val) {
                        setState(() => title = val);
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 300,
              child: Form(
                key: _form_key2,
                child: TextFormField(
                  maxLines: null,
                  validator: (val) => val.isEmpty ? 'Enter Text' : null,
                  onChanged: (val) {
                    setState(() => text = val);
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: () async {
                  if (_form_key1.currentState.validate() &&
                      _form_key2.currentState.validate() &&
                      _image != null) {
                    print('ok');
                    OurUser user = await dbMethods.getOurUserbyEmail(auth.getCurrEmail());

                    Map<String, String> userInfoMap = {
                      "email": user.email,
                      "name": title,
                      "type": user.type,
                      "profile_pic": 'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
                      "location": 'Canada',
                      "bio": text,
                      //merge
                    };
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    'Bio',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.lightBlue[700],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
