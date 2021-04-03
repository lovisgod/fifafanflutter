import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String imagePath = "";
  TextEditingController nameTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController clubTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();
  TextEditingController shortBioTextController = TextEditingController();
  TextEditingController favQuotesTextController = TextEditingController();
  TextEditingController languageTextController = TextEditingController();
  TextEditingController websiteTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update your profile',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:BorderRadius.circular(100)
                      ),
                      child: GestureDetector(
                        onTap: () {
                          uploadPicture();
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: FileImage(
                            File(this.imagePath)
                        ),
                        fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: nameTextController,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: phoneTextController,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: clubTextController,
                    decoration: InputDecoration(
                      hintText: 'Club',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: addressTextController,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: genderTextController,
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: shortBioTextController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'ShortBio',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: favQuotesTextController,
                    decoration: InputDecoration(
                      hintText: 'Favourite Quotes',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: languageTextController,
                    decoration: InputDecoration(
                      hintText: 'Language',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: websiteTextController,
                    decoration: InputDecoration(
                      hintText: 'Website',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF131F38),
                              border: Border.all(color: Color(0xFF131F38)),
                              borderRadius: BorderRadius.circular(10.0)),
                          alignment: Alignment.center,
                          child: Text(
                            'Submit Profile',
                            textScaleFactor: 1.5, // makes the text 50% bigger
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  uploadPicture() async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.imagePath = file.path;
    });;
  }
}
