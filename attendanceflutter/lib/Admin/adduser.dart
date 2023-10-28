import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add a User'),
      // ),
      body: Center(
        child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Text(
                      'Add User',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: w * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        prefixIcon: Icon(Icons.abc), // Use the email icon
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.deepPurple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.02,
                    height: h * 0.02,
                  ),
                  Container(
                    width: w * 0.8,
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      // textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Branch",
                        prefixIcon: Icon(Icons.abc_sharp), // Use the lock icon
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.deepPurple),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.04,
                    height: h * 0.04,
                  ),
                  // TextButton(onPressed: () {}, child: Text('Forgot Password?')),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add'),
                  ),
                  SizedBox(
                    height: h * 0.02,
                    width: w * 0.02,
                  ),
                  // Text("Don't Have an Account ?"),
                  // SizedBox(
                  //   height: h * 0.001,
                  //   width: w * 0.001,
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => SignUp(),
                  //       ),
                  //     );
                  //   },
                  //   child: Text('Sign Up'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
