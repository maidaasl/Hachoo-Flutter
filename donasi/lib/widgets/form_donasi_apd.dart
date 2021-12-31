import 'package:flutter/material.dart';
import '../screens/konfirmasi.dart';

class FormDonasiApd extends StatefulWidget {
  const FormDonasiApd({Key? key}) : super(key: key);

  @override
  _FormDonasiApdState createState() => _FormDonasiApdState();
}

enum SingingCharacter { RSUDTanahAbang, RSUDCempakaPutih, RSUDCengkareng, RSUDKalideres }

class _FormDonasiApdState extends State<FormDonasiApd> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool tabung1 = false;
  bool tabung2 = false;
  bool tabung3 = false;
  SingingCharacter? _character = SingingCharacter.RSUDTanahAbang;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        const SizedBox(height: 18,),
                        Positioned ( // headline
                          child: Container(
                            child: Column(
                              children: const [
                                Text("Donasi Alat Pelindung Diri",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      // color: Color(0xff59A5D8)
                                    )
                                ),
                                Divider(
                                    color: Colors.black
                                ),
                                Text("Bantu para tim medis untuk terhindar dari paparan Covid-19",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      // color: Color(0xff59A5D8)
                                    )
                                ),
                              ],
                            ),
                            decoration: BoxDecoration (
                                color: const Color(0xffafe2d6),
                                borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          ),
                          left: 0.0,
                          bottom: 108.0,
                        ),

                        const SizedBox(height: 18,),

                        Positioned ( // headline
                          child: Container(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  title: const Text("Donasi sebagai anonymus"),
                                  value: checkedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValue = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                )
                              ],
                            ),
                            decoration: BoxDecoration (
                              color: const Color(0xffafe2d6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          left: 0.0,
                          bottom: 108.0,
                        ),

                        const SizedBox(height: 18,),
                        Positioned ( // headline
                          child: Container(
                            child: Column(
                              children: [
                                const Text("Sasaran Penerima",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      // color: Color(0xff59A5D8)
                                    )
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                ListTile(
                                  title: const Text('RSUD Tanah Abang'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.RSUDTanahAbang,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('RSUD Cempaka Putih'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.RSUDCempakaPutih,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('RSUD Cengkareng'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.RSUDCengkareng,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('RSUD Kalideres'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.RSUDKalideres,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration (
                              color: const Color(0xffafe2d6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          ),
                          left: 0.0,
                          bottom: 108.0,
                        ),

                        const SizedBox(height: 18,),
                        Positioned ( // headline
                          child: Container(
                            child: Column(
                              children: [
                                const Text("Donasi Kebutuhan Barang",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      // color: Color(0xff59A5D8)
                                    )
                                ),
                                const Divider(
                                    color: Colors.black
                                ),
                                CheckboxListTile(
                                  title: const Text("Masker KN95"),
                                  value: tabung1,
                                  onChanged: (newValue) {
                                    setState(() {
                                      tabung1 = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                ),

                                CheckboxListTile(
                                  title: const Text("Sarung tangan medis"),
                                  value: tabung2,
                                  onChanged: (newValue) {
                                    setState(() {
                                      tabung2 = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                ),

                                CheckboxListTile(
                                  title: const Text("Masker 3ply"),
                                  value: tabung3,
                                  onChanged: (newValue) {
                                    setState(() {
                                      tabung3 = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                ),
                              ],
                            ),
                            decoration: BoxDecoration (
                              color: const Color(0xffafe2d6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                          ),
                          left: 0.0,
                          bottom: 108.0,
                        ),

                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15),
                            primary: Colors.blueGrey,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),),

                          onPressed: () {
                            if (_formKey.currentState!.validate() && (tabung1==true || tabung2==true || tabung3==true)) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('lnjut')),
                              );
                              Route route = MaterialPageRoute(
                                  builder: (context) => Konfirmasi());
                              Navigator.push(context, route);
                            }
                            else {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Mohon lengkapi data')),
                              );
                            }
                          },
                          child: const Text('Lanjutkan Pengiriman'),
                        ),
                      ],
                    )
                )
              ],
            )
        )
      )
    );
  }
}