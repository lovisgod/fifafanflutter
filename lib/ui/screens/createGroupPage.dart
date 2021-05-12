import 'package:sportfan/repository/podcatListRepository.dart';
import 'package:sportfan/ui/views/flushAlert.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  TextEditingController nameTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();

  FifaRepository repository = FifaRepository();

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
                  'SPORTFANS',
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
                  'Connect with other fans and share good things about sport',
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
                    controller: nameTextController,
                    decoration: InputDecoration(
                      hintText: 'Group name',
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
                    controller: descTextController,
                    decoration: InputDecoration(
                      hintText: 'Description',
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
              GestureDetector(
                onTap: () {
                  // handleLogin(context);
                  creategroup(nameTextController.text.toString(), descTextController.text.toString(), context);
                },
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF1977F1),
                            border: Border.all(color: Color(0xFF1977F1)),
                            borderRadius: BorderRadius.circular(40.0)),
                        alignment: Alignment.center,
                        child: Text(
                          'Proceed',
                          textScaleFactor: 1.5, // makes the text 50% bigger
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  creategroup(String name, String desc, BuildContext context) async {
    var res = await repository.createGroup(name, desc);
    Navigator.pop(context);
    if(res != 200) {
      await FlushAlert.show(
          context: context,
          message: 'Operation not successful',
          isError: true,
          isDismisble: true
      );
    } else {
      await FlushAlert.show(
          context: context,
          message: 'Operation successful',
          isError: false,
          isDismisble: true
      );
      Navigator.pop(context);
    }
  }
}
