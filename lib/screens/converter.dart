import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  var satuanPanjangController = TextEditingController();
  var konversiSatuanPanjangController = TextEditingController();
  var satuan = ["km", "hm", "dam", "m", "dm", "cm", "mm"];
  String dropdownSatuanPanjangValue;
  String dropdownKonversiSatuanPanjangValue;
  double operand;

  // RegExp removeZero = RegExp(r"([.]*0)(?!.*\d)");

  String removeTrailingZero(String string) {
    if (!string.contains('.')) {
      return string;
    }
    string = string.replaceAll(RegExp(r'0*$'), '');
    if (string.endsWith('.')) {
      string = string.substring(0, string.length - 1);
    }
    return string;
  }

  void initState() {
    dropdownSatuanPanjangValue = this.satuan[0];
    dropdownKonversiSatuanPanjangValue = this.satuan[0];
    super.initState();
  }

  void hitungKonversi() {
    setState(() {
      switch (dropdownSatuanPanjangValue) {
        case "km":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 1;
              break;
            case "hm":
              operand = 10;
              break;
            case "dam":
              operand = 100;
              break;
            case "m":
              operand = 1000;
              break;
            case "dm":
              operand = 10000;
              break;
            case "cm":
              operand = 100000;
              break;
            case "mm":
              operand = 1000000;
              break;
            default:
          }
          break;
        case "hm":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 0.1;
              break;
            case "hm":
              operand = 1;
              break;
            case "dam":
              operand = 10;
              break;
            case "m":
              operand = 100;
              break;
            case "dm":
              operand = 1000;
              break;
            case "cm":
              operand = 10000;
              break;
            case "mm":
              operand = 100000;
              break;
            default:
          }
          break;
        case "dam":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 0.01;
              break;
            case "hm":
              operand = 0.1;
              break;
            case "dam":
              operand = 1;
              break;
            case "m":
              operand = 10;
              break;
            case "dm":
              operand = 100;
              break;
            case "cm":
              operand = 1000;
              break;
            case "mm":
              operand = 10000;
              break;
            default:
          }
          break;
        case "m":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 0.001;
              break;
            case "hm":
              operand = 0.01;
              break;
            case "dam":
              operand = 0.1;
              break;
            case "m":
              operand = 1;
              break;
            case "dm":
              operand = 10;
              break;
            case "cm":
              operand = 100;
              break;
            case "mm":
              operand = 1000;
              break;
            default:
          }
          break;
        case "dm":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 0.0001;
              break;
            case "hm":
              operand = 0.001;
              break;
            case "dam":
              operand = 0.01;
              break;
            case "m":
              operand = 0.1;
              break;
            case "dm":
              operand = 1;
              break;
            case "cm":
              operand = 10;
              break;
            case "mm":
              operand = 100;
              break;
            default:
          }
          break;
        case "cm":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 0.00001;
              break;
            case "hm":
              operand = 0.0001;
              break;
            case "dam":
              operand = 0.001;
              break;
            case "m":
              operand = 0.01;
              break;
            case "dm":
              operand = 0.1;
              break;
            case "cm":
              operand = 1;
              break;
            case "mm":
              operand = 10;
              break;
            default:
          }
          break;
        case "mm":
          switch (dropdownKonversiSatuanPanjangValue) {
            case "km":
              operand = 0.000001;
              break;
            case "hm":
              operand = 0.00001;
              break;
            case "dam":
              operand = 0.0001;
              break;
            case "m":
              operand = 0.001;
              break;
            case "dm":
              operand = 0.01;
              break;
            case "cm":
              operand = 0.1;
              break;
            case "mm":
              operand = 1;
              break;
            default:
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konversi Satuan"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan[900], Colors.indigo],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Satuan Panjang",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: this.satuanPanjangController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          onChanged: (value) {
                            hitungKonversi();
                            if (value.isEmpty) {
                              konversiSatuanPanjangController.text = "";
                            }
                            konversiSatuanPanjangController.text =
                                removeTrailingZero((double.parse(
                                            satuanPanjangController.text) *
                                        operand)
                                    .toString());
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField(
                          iconSize: 20,
                          iconEnabledColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurple[50]),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          dropdownColor: Colors.grey[800],
                          items: this.satuan.map<DropdownMenuItem>((st) {
                            return DropdownMenuItem(
                              value: st,
                              child: Text(st, style: TextStyle(fontSize: 16)),
                            );
                          }).toList(),
                          value: this.dropdownSatuanPanjangValue,
                          onChanged: (value) {
                            setState(() {
                              this.dropdownSatuanPanjangValue = value;
                              hitungKonversi();
                              konversiSatuanPanjangController.text =
                                  removeTrailingZero((double.parse(
                                              satuanPanjangController.text) *
                                          operand)
                                      .toString());
                            });
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Konversi Satuan Panjang",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          enabled: false,
                          controller: this.konversiSatuanPanjangController,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField(
                          iconSize: 20,
                          iconEnabledColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepPurple[50]),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          dropdownColor: Colors.grey[800],
                          items: this.satuan.map<DropdownMenuItem>((st) {
                            return DropdownMenuItem(
                              value: st,
                              child: Text(st, style: TextStyle(fontSize: 16)),
                            );
                          }).toList(),
                          value: this.dropdownKonversiSatuanPanjangValue,
                          onChanged: (value) {
                            setState(() {
                              this.dropdownKonversiSatuanPanjangValue = value;
                              hitungKonversi();
                              konversiSatuanPanjangController.text =
                                  removeTrailingZero((double.parse(
                                              satuanPanjangController.text) *
                                          operand)
                                      .toString());
                            });
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
