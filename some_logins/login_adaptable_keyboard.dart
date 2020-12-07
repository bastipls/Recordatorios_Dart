

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
/*
Install package and add in pubspec: https://pub.dev/packages/flutter_keyboard_visibility
  flutter_keyboard_visibility:
  This code only works in vertical screen

   The funcion of the keyboard visibility is detecting when the keyboard is show or is hidden, 
   after that i move the form on top of the screen

  
*/


class LoginPage extends StatefulWidget {
  static final routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  bool _showKeyboard = false;
  @override
  void initState() {
    super.initState();
    // Saber si mi teclado esta oculto o visible:
    KeyboardVisibilityController().onChange.listen((bool visible) {
      _showKeyboard = visible;
     });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.bottomCenter,
        children: <Widget>[
          _createBackground(context),
          _loginForm(context)
        ],
      ),
      
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final top = !_showKeyboard ? size.height*0.25:size.height * 0.1;
    return ListView(

      children: <Widget>[
        Align(
          alignment: Alignment.center,

          child: AnimatedPadding(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeIn,
            padding:EdgeInsets.only(top: top),
            child: Column(
              children: <Widget>[
                Container(        
                  width: size.width * 0.85,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  margin: EdgeInsets.symmetric(vertical: 1.0),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color:Colors.black26,
                        blurRadius: 3.0,
                        offset:Offset(0.0,5.0),
                        spreadRadius: 3.0
                      )
                    ]
                  ),

                  child: Column(

                    children:<Widget>[
                      Text('Ingresar',style: TextStyle(fontSize: 20.0)),
                      SizedBox(height: 30.0,),
                      _inputEmail(context),
                      _inputPassword(context),
                      SizedBox(height: 10.0,),
                      _inputButton(context),
                      
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      // TODO llevar a reigstro
                      onPressed: (){}, 
                      child: Text('Registrate',style:TextStyle(color: Colors.deepPurple[300],))
                      ),
                      Text('|')
                      ,
                      FlatButton(
                      // TODO llevar a reigstro
                      onPressed: (){}, 
                      child: Text('Contraseña perdida',style:TextStyle(color: Colors.deepPurple[300],))
                      ),
                    
                  ],
                )
                
                
                
                



              ],
            ),
          ),
        ),

      ]
    );
  }

  Widget _inputEmail(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon:Icon(Icons.alternate_email,color: Theme.of(context).primaryColor,),
          hintText: 'ejemplo@gmail.com',
          labelText: 'Correo',
          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Theme.of(context).primaryColor, width: 0.5),
            ),
        ),
      ),
    );
  }

  Widget _inputPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
      child: TextField(
        obscureText: !_showPassword,
        decoration: InputDecoration(
          icon:Icon(Icons.lock_outlined,color: Theme.of(context).primaryColor,),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,color:_showPassword ? Theme.of(context).primaryColor:Colors.grey
              ), 
              onPressed: () {  
                setState(() => _showPassword = !_showPassword);              
              },
          ),
          labelText: 'Contraseña',
          focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Theme.of(context).primaryColor, width: 0.5),
            ),
        ),
      ),
    );
  }

  Widget _inputButton(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 50.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: (){},
    );
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final background = Container(
      height: size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: <Color>[
          Theme.of(context).primaryColor,
            Colors.deepPurple[400]
          ]
        )
      ),
    );
    final circle = (double width, double height) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color:Theme.of(context).primaryColor
      ),
    );
    
    final rhombus = (double width, double height) =>
    Container(
      width: width,
      height: height,
      color: Theme.of(context).primaryColor,
      transform: Matrix4.rotationZ(45*3.14/180),
     
    );



    return Stack(
      children: <Widget>[
        background,
        // Circulos
        Positioned(top: 90.0,left: 30.0,child: circle(100.0,100.0)),
        Positioned(top: 20.0,right: -50.0,child: circle(100.0,100.0)),
        Positioned(top: 220.0,right: 150.0,child: circle(50.0,50.0)),
        // Rombos
        Positioned(top:100.0,right:50.0,child:rhombus(50.0,50.0)),
        Positioned(top:100.0,right:50.0,child:rhombus(50.0,50.0)),
        Positioned(top:200.0,left:50.0,child:rhombus(50.0,50.0)),
        Container(
        
          padding: EdgeInsets.only(top:size.height * 0.08),
          child: Column(
            children: <Widget>[
              // Logo aqui
              // Icon(Icons.pedal_bike_rounded,color: Colors.white,size: 100.0,),
              SizedBox(height: 10.0,width: double.infinity,),
              Text('SAF3IKE',style: TextStyle(color: Colors.white,fontSize: 25.0),)
            ],
          ),
        )
      ],
    );
  }

  
}