import 'package:flutter/material.dart';
import 'package:local_auth/error_codes.dart';
//important
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:weather_app/authentication/lockscreen_auth.dart';
import 'package:weather_app/pages/weatherpage.dart';

class AuthHomePage extends StatefulWidget {
  const AuthHomePage({super.key});

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  //he line creates an instance of the LocalAuthentication class.
  //This instance (_auth) can then be used to access the methods provided by the LocalAuthentication class.
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI());
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Welcome to myWeather",
              style: TextStyle(
                color: Colors.teal,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () async {
                  if (!_isAuthenticated) {
                    final bool canAuththenticateWitBiometrics =
                        await _auth.canCheckBiometrics;
                    print(canAuththenticateWitBiometrics);
                    if (canAuththenticateWitBiometrics) {
                      //function that shows the popup to allow the user to actually authenticate themselves
                      final bool didAuthenticate = await _auth.authenticate(
                        localizedReason:
                            "Pease authenticate to allow weather to acess your information ",
                        //to not allow lockcreen passwords
                        // options:
                        //     const AuthenticationOptions(biometricOnly: true)
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Weatherpage()),
                    );
                  } else {
                    setState(() {
                      _isAuthenticated = false;
                    });
                  }
                },
                //on pressed an on authenticate change the lock closed to lock open
                child: Icon(
                  _isAuthenticated ? Icons.lock_outlined : Icons.lock_open,
                  color: Colors.teal,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
