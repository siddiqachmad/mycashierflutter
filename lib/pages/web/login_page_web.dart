import 'package:flutter/material.dart';
import 'package:mycashierdicoding/component/custom_text_field.dart';
import 'package:mycashierdicoding/component/util.dart';
import 'package:mycashierdicoding/pages/mainpage/MenuPage.dart';

class LoginPageWeb extends StatefulWidget {

  @override
  _LoginPageWebState createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  TextEditingController etUsername=new TextEditingController();
  TextEditingController etPassword=new TextEditingController();

  doLogin(){
    if(etUsername.text=="admin" && etPassword.text=="admin"){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return MenuPage();
      }));
    }else{
      dialog(context, "Username atau Password salah");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("MY CASHIER",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: ClipRect(
                              child: Image.asset("images/cashier.png"),
                            )
                          )

                      ],
                    ),
                  ),
            )),
            Expanded(
              flex: 1,
              child: Center(
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
            )
          ],
        )
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
