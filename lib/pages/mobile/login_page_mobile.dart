import 'package:flutter/material.dart';
import 'package:mycashierdicoding/component/custom_text_field.dart';
import 'package:mycashierdicoding/component/util.dart';

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  _LoginPageMobileState createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  TextEditingController etUsername=new TextEditingController();
  TextEditingController etPassword=new TextEditingController();

  doLogin(){
    if(etUsername.text=="admin" && etPassword.text=="admin"){

    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("MY CASHIER",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  ClipRect(
                    child: Image.asset("images/cashier.png",height: 200.0, width: 200.0,),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: _formWidget(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formWidget(){
    return Form(
      child: Column(
        children: [
          CustomTextField(controller: etUsername,hintText: "Username",icon: Icon(Icons.person),isPassword: false,),
          CustomTextField(controller: etPassword,hintText: "Password",icon: Icon(Icons.vpn_key),isPassword: true,),
          SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            child: largeButton(iconData: Icons.subdirectory_arrow_left, onPressed: (){
              doLogin();
            }),
          )
        ],
      ),
    );
  }

}
