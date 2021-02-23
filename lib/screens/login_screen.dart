import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.cyan[900], Colors.indigo],
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                child: Text(
                  "Welcome",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text(
                  "Please login here",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 70),
              Container(
                child: Text(
                  "Sign In",
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  final Text placeHolder;
  final Icon icon;
  final myController = TextEditingController();
  final bool obscureText;

  InputForm({
    this.placeHolder,
    this.icon,
    this.obscureText = false,
  });
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  void dispose() {
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: widget.myController,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          hintText: widget.placeHolder.data,
          hintStyle: widget.placeHolder.style,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white38,
              width: 2,
            ),
          ),
          errorText: null,
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final username = InputForm(
    icon: Icon(Icons.mail, color: Colors.white),
    placeHolder: Text(
      "Username",
      style: TextStyle(
        color: Colors.grey[300],
      ),
    ),
  );

  final password = InputForm(
    placeHolder: Text(
      "Password",
      style: TextStyle(
        color: Colors.grey[300],
      ),
    ),
    obscureText: true,
    icon: Icon(Icons.lock, color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: this._formKey,
        child: Column(
          children: [
            this.username,
            SizedBox(height: 20),
            this.password,
            SizedBox(height: 40),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4,
              onPressed: () => {
                if (this.username.myController.text == "udacodingid" &&
                    this.password.myController.text == "udacodingJaya2021")
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    )
                  }
                else if (this.username.myController.text.isEmpty ||
                    this.password.myController.text.isEmpty)
                  {
                    if (this.username.myController.text.isEmpty)
                      {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Field username tidak boleh kosong"),
                            action: SnackBarAction(
                              label: "X",
                              textColor: Colors.white,
                              onPressed: () =>
                                  Scaffold.of(context).hideCurrentSnackBar(),
                            ),
                          ),
                        )
                      }
                    else
                      {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Field password tidak boleh kosong"),
                            action: SnackBarAction(
                              label: "X",
                              textColor: Colors.white,
                              onPressed: () =>
                                  Scaffold.of(context).hideCurrentSnackBar(),
                            ),
                          ),
                        )
                      }
                  }
                else if (this.password.myController.text.length < 6)
                  {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Field password tidak boleh kurang dari 6 karakter"),
                        action: SnackBarAction(
                          label: "X",
                          textColor: Colors.white,
                          onPressed: () =>
                              Scaffold.of(context).hideCurrentSnackBar(),
                        ),
                      ),
                    )
                  }
                else
                  {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Credentials Salah"),
                        action: SnackBarAction(
                          label: "X",
                          textColor: Colors.white,
                          onPressed: () =>
                              Scaffold.of(context).hideCurrentSnackBar(),
                        ),
                      ),
                    )
                  }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
