import 'package:flutter/material.dart';
import 'package:flutter_ngekos/pages/home_page.dart';
import 'package:flutter_ngekos/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/splash_image.png')),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo.png"))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Cari kos-kosan sesuai \n and Stay Happy',
                    style: blackTextStyle.copyWith(fontSize: 24.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Stop membuang waktu \n pada tempat yang tidak habitable',
                    style: grayTextStyle.copyWith(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    child: MaterialButton(
                      color: purpleColor,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child: Text(
                        'Explore Now',
                        style: whiteTextStyle.copyWith(fontSize: 18.0),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
