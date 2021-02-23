import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Physics extends StatefulWidget {
  @override
  _PhysicsState createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
  final panjangLuas = TextEditingController();

  final lebarLuas = TextEditingController();

  final panjangVolume = TextEditingController();

  final lebarVolume = TextEditingController();

  final tinggiVolume = TextEditingController();

  double hasilLuas = 0;

  double hasilVolume = 0;

  RegExp removeZero = RegExp(r"([.]*0)(?!.*\d)");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Hitung Fisika"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal[900], Colors.indigo],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          children: [
            Container(
              child: Text(
                "Menghitung Luas",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholder: "Masukkan Panjang",
              myController: this.panjangLuas,
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholder: "Masukkan Lebar",
              myController: this.lebarLuas,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4,
              onPressed: () => {
                setState(() {
                  this.hasilLuas = double.parse(panjangLuas.text) *
                      double.parse(lebarLuas.text);
                })
              },
              child: Text("Hitung Luas"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Hasil Luas : ${this.hasilLuas.toString().replaceAll(this.removeZero, "")}",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                "Menghitung Volume",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholder: "Masukkan Panjang",
              myController: this.panjangVolume,
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholder: "Masukkan Lebar",
              myController: this.lebarVolume,
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholder: "Masukkan Tinggi",
              myController: this.tinggiVolume,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 4,
              onPressed: () => {
                setState(() {
                  this.hasilVolume = double.parse(panjangVolume.text) *
                      double.parse(lebarVolume.text) *
                      double.parse(tinggiVolume.text);
                })
              },
              child: Text("Hitung Volume"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Hasil Volume : ${this.hasilVolume.toString().replaceAll(this.removeZero, "")}",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final placeholder;
  final Icon icon;
  final myController;
  InputField({this.placeholder, this.icon, this.myController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      controller: this.myController,
      decoration: InputDecoration(
        labelText: this.placeholder,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
        labelStyle: TextStyle(color: Colors.white, fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
