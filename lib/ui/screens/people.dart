import 'package:fifafan/repository/podcatListRepository.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  TextEditingController search_view = TextEditingController();
  FifaRepository fifaRepository = FifaRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                'List of friends',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey,
            ),
            child: new TextField(
              controller: search_view,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Search for a user",
                hintStyle: new TextStyle(color: Colors.grey[300]),
              ),
              textAlign: TextAlign.center,
            ),
          ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCartItem(context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1.0,
                      color: Colors.grey,
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ],
          )),
    );
  }

  _buildCartItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          child: Image(
            image: NetworkImage(
                "https://res.cloudinary.com/psirius-eem/image/upload/v1612957194/media_mall/185d9c23-2f18-422c-b197-ddf26f6e4bbd.jpg"),
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.grey),
        ),
        title: Text(
          "Sample sample",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
            fontSize: 15.0,
          ),
          textAlign: TextAlign.left,
        ),
        subtitle: Row(
          children: <Widget>[
            Text(
              'Arsenal Fan',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              '10 Followers',
              style: TextStyle(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                letterSpacing: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
