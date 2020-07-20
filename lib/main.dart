import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
scopes: [
  'profile',
  'email'
]
);
void main() => runApp(MaterialApp(
title: 'Google Sign In',
home:SignInDemo()
));

class SignInDemo extends StatefulWidget{

  _SignInDemoState createState() =>_SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo>{

GoogleSignInAccount _currentUser;



void initState() {
  super.initState();
  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
    setState(() {
      _currentUser = account;
    });
  });
  _googleSignIn.signInSilently();
}
  Widget build(BuildContext context){
    return MaterialApp(
   home: Scaffold(
     //backgroundColor: Colors.lightBlue[100],
    appBar: AppBar(
      title: Text('Google Sign In Demo'),
    ),
    body:Container(
      child: _buildBody(),
      height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops:[0.1,0.4,0.7,0.9],
            ),
            //image:DecorationImage(
            //  image: AssetImage("lib/images/hospital.jpg"),
              
              ),
          ),
          
      ),
    );
  
  }
 Widget _buildBody() {
  if(_currentUser!=null){
    return Column(
      children: <Widget>[
        ListTile(
          leading: GoogleUserCircleAvatar(
            identity: _currentUser
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
        ),
        RaisedButton(onPressed: _handleSignOut,
                             child: Text('SIGN OUT'), 
                )
              ],
            );
            }
            else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('SIGN UP',
          style:  TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
              ),
          //RaisedButton(onPressed: _handleSignIn,
                       // child: Text('SIGN IN'),
                 // ),
                 // SizedBox(height:30.0),
            //_buildEmailLTF(),
           // SizedBox(height:30.0),
           // _buildPasswordLTF(),
           // _buildForgot(),
           // _buildRemember()
          // _buildColor(),
          //_buildBackground(),
            _buildButton(),
            _buildOr(),
            _buildButton2(),
             
           // _buildColor(),
                ],
              );
            }
          }
          Future<void> _handleSignIn() async{
            try{
            await _googleSignIn.signIn();
            }catch(error){
              print(error);
            }
          }
         
         Future<void> _handleSignOut() async{
           _googleSignIn.disconnect();
  }

Widget _buildButton() {
  return Container(
                  
                  padding: EdgeInsets.symmetric(vertical:25.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: _handleSignIn,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                ),
                 color: Colors.white,
                child: Text('Login with Google',
                style:  TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              color: Colors.black,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
                ),
                
              ),
              
            );
}

Widget _buildOr(){
  return Column(
              children:<Widget>[
                Text(
                  '-OR-',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height:20.0),
                Text(
                  'Sign In With',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ) 
                )
              ],
            );
}

Widget _buildButton2(){
  return Container(
                  
                  padding: EdgeInsets.symmetric(vertical:25.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () => print('Button pressed'),
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                ),
                color: Colors.white,
                child: Text('Biometric',
                style:  TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              color: Colors.black,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
                ),
              ),
            );
}
}

