import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  bool _isLoggedIn = false;
  bool _isSignedInGoogle = true;
  final facebookLogin = FacebookLogin();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Map userProfile;

  CurrentUser google = new CurrentUser(displayName, email);
  UserProfile facebook = new UserProfile(name, email);
  
  static String email;
  static String displayName;
  static String name;

  _signinWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
        _isSignedInGoogle = true;
      });
    }
    catch(err) {
      print(err);
    }
  }

  _loginWithFacebook() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
          _isSignedInGoogle = false;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;
    }
  }

  _signOutGoogle() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  _logOutFacebook() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: _isLoggedIn
        ? _isSignedInGoogle
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome back " + _googleSignIn.currentUser.displayName + ". You are sign in with Google: " + _googleSignIn.currentUser.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
                  )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      child: Text("Info"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/info');
                      },
                    )
                  ]
                ),  
                OutlineButton(
                  child: Text("Logout"),
                  onPressed: () {
                    _signOutGoogle();
                  }
                )
              ], 
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome back " + userProfile["name"] + ". You are login with Facebook: " + userProfile["email"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      child: Text("Info"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/info');
                      }
                    ),
                    OutlineButton(
                      child: Text("Logout"),
                      onPressed: () {
                        _logOutFacebook();
                      }
                    )
                  ]
                )
              ] 
            )
        : Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
                color: Colors.black45,
                colorBlendMode: BlendMode.darken
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(
                    size: _iconAnimation.value * 100.0
                  ),
                  Text(
                    'Welcome to my App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white
                    )
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Container(
                        width: 250.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.google),
                                SizedBox(width: 10.0),
                                Text(
                                  " Sign in with Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0
                                  )
                                )                 
                              ]
                            ),
                            onPressed: () {
                              _signinWithGoogle();
                            }
                          ),
                        )
                      ),
                      Container(
                        width: 250.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.facebookSquare),
                                SizedBox(width: 10.0),
                                Text(
                                  " Login with Facebook",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0
                                  )
                                )                 
                              ]
                            ),
                            onPressed: () {
                              _loginWithFacebook();
                            }
                          ),
                        )
                      )
                    ] 
                  )
                ]
              )
            ] 
          )         
        )
    );
  }
}

class CurrentUser {
  final String displayName;
  final String email;

  CurrentUser(this.displayName, this.email);
}

class UserProfile {
  final String name;
  final String email;

  UserProfile(this.name, this.email);
}
