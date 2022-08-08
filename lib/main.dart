import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_app/singup_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureActive= true;
  final formkey = GlobalKey<FormState>();
  late String userName,userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff22A4DE),    
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "images/icon.png",
                height: 100,
                width: 100
              ),
              Text(
                "Motivational Quotes",
                style: TextStyle(fontSize: 25,color: Colors.white)),
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height*.6,
                width: MediaQuery.of(context).size.width*.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          autofocus: true,
                          onChanged: (value){
                            setState(() {
                              userName = value;
                              print(userName);
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.account_circle)
                          ),
                          validator: (input){
                            if(input==null||input.isEmpty){
                              return 'Please enter your email';
                            }else{
                              return null;
                            }
                          }
                        ),
                        TextFormField(
                          obscureText: obscureActive,
                          autofocus: true,
                          onChanged: (value){
                            setState(() {
                              userPassword = value;
                              print(userPassword);
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  obscureActive=!obscureActive;
                                });
                              }, 
                              icon: (obscureActive)? Icon(Icons.visibility):Icon(Icons.visibility_off))
                          ),
                          validator: (input){
                            if(input==null||input.isEmpty){
                              return 'Enter your password';
                            }else{
                              return null;
                            }



                            /// here will be add the reaming code for log in



                          }
                        ),
                        
                        
                        //forghot password btn
                        TextButton(
                          onPressed: () {
                            print('forghot text btn pressed');
                            //_makePhoneCall('tel: 01777506247');
                            _filePicker();




                              //rest of the code forghot password btn





                          },
                          // ignore: prefer_const_constructors
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Forghot Password?')),
                          
                        ),
                        
                        //main login btn
                        Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          color: Colors.blue,
                          child:Container(
                            width: MediaQuery.of(context).size.width*.2,
                            height: MediaQuery.of(context).size.height*.05,
                            child: MaterialButton(
                              onPressed: (){
                                if(formkey.currentState!.validate()){
                                  print('all input are valid');



                                  //rest of the fuctionality will add here 
                                  //to log in succsesfull 



                                }else{
                                  print('not vaild');
                                }
                                print('Login btn Pressed');
                              },
                              // ignore: prefer_const_constructors
                              child: Center(child: const Text('Login',  style: TextStyle(fontSize: 20,color: Colors.white)))
                            ),
                          )
                        ),
                        
                        //singup btn
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a Account? "),
                            TextButton(
                              onPressed: () {
                                print('Register text btn clicked');
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>LoginPage()
                                  )
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>SingupPage()
                                  )
                                );
                              }, 
                              child: Text('Register')
                            )
                          ],
                        ),
                        
                        //bottom fb/google login btn
                        const Text(
                          ' Login With ', 
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Arial",
                            color: Colors.blue
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Image.asset("images/facebook_icon.png"),
                              onPressed: (){


                                //google sign in

                                _launchInBrowser('https://www.facebook.com/');
                                print('fb btn clicked');
                              }, 
                            ),
                            IconButton(
                              icon: Image.asset("images/google_icon.png"),
                              onPressed: (){





                                _launchInBrowser('https://www.google.com/');
                                print('google btn clicked');
                              }, 
                            ),
                          ],
                        )

                      ],
                    )
                  ),
                ),
              )
            ]
          )
        ),
      ),
    );
  }
  
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<FilePickerResult?> _filePicker() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','pdf','doc']
    );
    return result;
      // if (result != null) {
      //   File file = File(result.files.single.path);
      // } else {
      // // User canceled the picker
      // }
  }

  
}

