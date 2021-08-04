import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:skype_clone/models/call.dart';
import 'package:skype_clone/resources/call_methods.dart';
import 'package:skype_clone/screens/callscreens/call_screens.dart';
import 'package:skype_clone/screens/chatscreens/widgets/cached_image.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  CallMethods callMethods = CallMethods();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ligando...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CachedImage(
              call.callerPic,
              isRound: false,
              radius: 180,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.call_end),
                    color: Colors.redAccent,
                    onPressed: () async {
                      await callMethods.endCall(call: call);
                    }),
                SizedBox(
                  width: 25,
                ),
                IconButton(
                    icon: Icon(Icons.call),
                    color: Colors.green,
                    onPressed: () async => await Permission.camera.isRestricted
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CallScreen(call: call),
                            ))
                        : {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
