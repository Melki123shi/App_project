import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/signup.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Welcome",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "We are glad to have you as our new  Employee!",
            style: TextStyle(fontSize: 15),
          ),
          // for gap
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 50.0, right: 50.0, top: 15, bottom: 0),
            child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Confirmation Code',
                    hintText: 'Enter Your Confirmation Code'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(6,
                      errorText: "Password should be atleast 6 characters"),
                  MaxLengthValidator(10,
                      errorText:
                          "Password should not be greater than 10 characters")
                ])),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(210, 48, 188, 136)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
              ),
              child: Text(
                "Confirm",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
