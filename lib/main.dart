import 'package:fifafan/bloc/socketBloc.dart';
import 'package:fifafan/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'data/fifafancontroller.dart';

void main() async {
  await GetStorage.init();
  print('getting here1');
  setupSocket();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fifafans',
      defaultTransition: Transition.rightToLeft,
      getPages: FifanRouter.route,
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

}

void setupSocket() {
  print('this is getting here');
  StreamSocket streamSocket = StreamSocket();

  final FifaController controller = Get.put(FifaController());
  var token = controller.getToken();
  print('this is token: ${token}');
  var builder = IO.OptionBuilder()
      .setTransports(['websocket'])
      .setExtraHeaders({'token': 'Bearer ${token.isNotEmpty ? token : ''}'})
      .build();
  IO.Socket socket = IO.io('https://fifafans.herokuapp.com', builder);
  socket.onConnect((_) {
    print('connect');
  });

  socket.onConnectError((data) => print('connection error: ${data}'));

  socket.connect();

  //When an event recieved from server, data is added to the stream
  socket.on('event', (data) => streamSocket.addResponse);
  socket.onDisconnect((_) => print('disconnect'));
}
