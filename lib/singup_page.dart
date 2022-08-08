import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({ Key? key }) : super(key: key);

  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  bool obscureActive=true,isChecked= false;
  final formkey = GlobalKey<FormState>();


  Widget makeTextField(String hintText,Icon prefixIcon,String validationPettern,String errorText){
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ),
        validator: (value){
          if(RegExp(validationPettern).hasMatch(value!)){
            return null;
          }else{
            return errorText;
          }
        },
      )
    );
  }

  Widget makePassTextField(String hintText,Icon prefixIcon,String validatorPettern,String errorText){
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        obscureText: obscureActive,
        autofocus: true,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            onPressed: (){
              setState((){
                obscureActive=!obscureActive;
              });
            }, 
            icon: (obscureActive)? Icon(Icons.visibility):Icon(Icons.visibility_off)
            ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ),
        validator: (value){
          if(RegExp(validatorPettern).hasMatch(value!)){
            return null;
          }else{
            return errorText;
          }
        },
      )
    );
  }

  



  @override
  Widget build(BuildContext context) {
  
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff22A4DE),
      body: Padding(
        padding: EdgeInsets.only(top: 80.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'images/icon.png',
                height: 100,
                width: 100
              ),
              Text(
                  "Motivational Quotes",
                  style: TextStyle(fontSize: 25,color: Colors.white)
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: screenHeight*.6,
                width: screenWidth*.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        makeTextField('Full Name', Icon(Icons.person),r"[a-zA-Z]{10}",'Enter a vaild name'),
                        makeTextField('Email', Icon(Icons.email),
                        r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",'Enter a vaild email'),
                        makeTextField('Phone Number', Icon(Icons.phone_android),r"[0-9]{11}",'Invalid Phone Number'),
                        makePassTextField('Password', Icon(Icons.lock),r"^[0-9,A-Z]{10}$",'usage a strong password'),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked, 
                              onChanged:(value){
                                setState(() {
                                  isChecked=!isChecked;
                                });
                              }),
                            Text(
                              "I read and agree to",
                              style: TextStyle(color: Colors.grey,)
                            ),
                            TextButton(
                              onPressed: (){
                                // open a pop up to read the tearm & conditions
                                print('Terms and Conditions CLICKED');
                              }, 
                              child: Text(
                                "Terms and Conditions",
                                style: TextStyle(color: Colors.blue
                                )
                              )
                            )
                          ],

                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(top:25,bottom: 25),
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            color: Colors.blue,
                            child: Container(
                              height: screenHeight*.05,
                              width: screenWidth*.25,
                              child: MaterialButton(
                                onPressed: (){
                                  if(formkey.currentState!.validate()){
                                  print('singup btn clicked all info vaild');
                                  }else{
                                    print('singup clicked info not vaild');
                                  }
                                child: Text('Sing Up',  style: TextStyle(fontSize: 20,color: Colors.white));
                                }
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? '),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context)=>LoginPage()
                                  )
                                );
                              }, 
                              child: Text('Sing in')),
                          ],
                        )
                      ]                  
                    )
                  )
                ),
              )
            ],
          ),
        ),),
    );
  }




}