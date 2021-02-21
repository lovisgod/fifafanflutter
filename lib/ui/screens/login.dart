import 'package:fifafan/data/fifafancontroller.dart';
import 'package:fifafan/network/error.dart';
import 'package:fifafan/network/errorHelper.dart';
import 'package:fifafan/ui/screens/home_page.dart';
import 'package:fifafan/ui/views/flushAlert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
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
                    controller: controller.loginEmailTextController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
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
                    controller: controller.loginPasswordTextController,
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
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 100.0),
                child: RichText(
                  text: TextSpan(
                    text: 'By signing up, you have accepted the',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFC4C4C4)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms and Conditions',
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
                GestureDetector(
                  onTap: () {
                    handleLogin(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        width: 141.0,
                        height: 67.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF1977F1),
                            border: Border.all(color: Color(0xFF1977F1)),
                            borderRadius: BorderRadius.circular(40.0)),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign in',
                          textScaleFactor: 1.5, // makes the text 50% bigger
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/auth/sign_up');
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          width: 141.0,
                          height: 67.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF131F38),
                              border: Border.all(color: Color(0xFF131F38)),
                              borderRadius: BorderRadius.circular(40.0)),
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

  handleLogin(BuildContext context) async {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
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
    try {
      var res = await controller.loginApi();
      if (res is ErrorType) {
        Navigator.pop(context);
        FlushAlert.show(
          context: context,
          message: errorTypeToString(res),
          isError: true,
        );
      } else {
        String token = res['data']['token'];
        print(token);
        controller.saveToken(token);
//        Get.toNamed('/homepage');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      }
    } catch (error) {
      print(error);
      Navigator.pop(context);
    }
  }
}
