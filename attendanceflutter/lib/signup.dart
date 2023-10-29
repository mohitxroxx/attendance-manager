import 'package:attendanceflutter/User/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              height: h * 0.7,
              width: w * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Card(
                elevation: 12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: w * 0.5,
                        child: TextField(
                          keyboardType: TextInputType.name,
                          // controller: nameController,
                          decoration: InputDecoration(
                            hintText: "User-Name",
                            prefixIcon: Icon(Icons.abc),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.deepPurple)),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: w * 0.02,
                      height: h * 0.02,
                    ),
                    Container(
                        width: w * 0.5,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          // controller: emailController,
                          decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.deepPurple)),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              )),
                        )),
                    SizedBox(
                      width: w * 0.02,
                      height: h * 0.02,
                    ),
                    Container(
                        width: w * 0.5,
                        child: TextField(
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.abc_sharp),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.deepPurple),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.deepPurple),
                              )),
                        )),
                    SizedBox(
                      width: w * 0.02,
                      height: h * 0.02,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // String userName = nameController.text;
                          // String userEmail = emailController.text;
                          // String userPhone = phoneController.text;

                          // print('Name : $userName');
                          // print('Mail : $userEmail');
                          // print('Phone : $userPhone');
                        },
                        child: Text('Sign Up')),
                    SizedBox(
                      height: h * 0.02,
                      width: w * 0.02,
                    ),
                    Text("Already Have an Account ?"),
                    SizedBox(
                      height: h * 0.001,
                      width: w * 0.001,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
