import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fifafan/data/fifafancontroller.dart';
import 'package:fifafan/network/error.dart';
import 'package:fifafan/network/errorHelper.dart';
import 'package:fifafan/ui/views/flushAlert.dart';

class SignUp extends StatelessWidget {
  final FifaController controller = Get.put(FifaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 70.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'FifaFans',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 40.0),
                child: Text(
                  'Connect with other fans and share good things about football',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: controller.signUpFullNameTextController,
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
                    controller: controller.signUpUserNameTextController,
                    decoration: InputDecoration(
                      hintText: 'User name',
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
                    controller: controller.signUpClubTextController,
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
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Obx(() => Text("${controller.role}")),
                    items:
                        <String>['player', 'fan', 'coach'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.role = value as RxString;
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: controller.signUpPhoneNumberTextController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
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
                    controller: controller.signUpEmailTextController,
                    decoration: InputDecoration(
                      hintText: 'Email Adress',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    controller: controller.signUpPasswordTextController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
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
                    controller: controller.signUpConfirmPasswordTextController,
                    decoration: InputDecoration(
                      hintText: 'confirm password',
                      // border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE7E9ED)),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: 'By signing up, you have accepted the',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFC4C4C4)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms and Conditions ',
                          style: TextStyle(
                            color: Color(0xFF1977F1),
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          )),
                      TextSpan(
                        text: 'of this service',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFC4C4C4)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      handleSignUp(context);
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
                            'Register',
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

  handleSignUp(BuildContext context) async {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Please wait...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    var res = await controller.signUpApi();
    if (res is ErrorType) {
      Navigator.pop(context);
      FlushAlert.show(
        context: context,
        message: errorTypeToString(res),
        isError: true,
      );
    } else {
      FlushAlert.show(
        context: context,
        message: 'SignUp is successful',
        isError: false,
      );
      Get.offNamed('/auth/login');
    }
  }
}
