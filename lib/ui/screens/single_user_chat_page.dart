import 'package:flutter/material.dart';

class ChatWithFriend extends StatefulWidget {
  String chatName;
  String userId;
  String followerId;
  bool canChat;

  ChatWithFriend({
    this.chatName, this.userId, this.followerId, this.canChat,
});
  @override
  _ChatWithFriendState createState() => _ChatWithFriendState();
}

class _ChatWithFriendState extends State<ChatWithFriend> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${this.widget.chatName}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: double.infinity,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (Alignment.topLeft),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (Colors.grey.shade200),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text('This is sample message', style: TextStyle(fontSize: 15),),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey,
              ),
              child: this.widget.canChat == false ? GestureDetector(
                onTap: () {

                },
                child: Center(
                  child: Text('Follow User',
                    style: TextStyle(
                     color: Colors.white,
                     fontSize: 20.0,
                      fontWeight: FontWeight.w800
                  ),
                  ),
                ),
              ) : new TextField(
                controller: controller,
                maxLines: null,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Input a message",
                  hintStyle: new TextStyle(color: Colors.grey[300]),
                  suffixIcon: IconButton(
                    onPressed: () => {
                      // send message
                    },
                    icon: Icon(Icons.send, color: Colors.white,),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
