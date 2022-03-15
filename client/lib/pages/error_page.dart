import 'package:flutter/material.dart';
import 'package:flutter_ngekos/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/error.png',
                  scale: 5,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Where are you doing?',
                  style: blackTextStyle.copyWith(fontSize: 24.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Seems like the page that you were\nrequest is already gone',
                  style: grayTextStyle.copyWith(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Back'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(purpleColor),
                      foregroundColor: MaterialStateProperty.all(whiteColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                )
              ],
            ),
          )),
    );
  }
}
