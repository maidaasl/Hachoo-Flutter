import 'package:flutter/material.dart';
import '../screens/konfirmasi.dart';

class FormDonasi extends StatefulWidget {
  const FormDonasi({Key? key}) : super(key: key);

  @override
  _FormDonasiState createState() => _FormDonasiState();
}

enum Sasaran { BantuanSosial, PasienCovid }

enum pay { ovo, gopay, dana, bca, bni, bri, mandiri }

class _FormDonasiState extends State<FormDonasi> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  String nomin = "";
  Sasaran? _character = Sasaran.BantuanSosial;
  pay? _pilihan = pay.ovo;

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
                                Text("Donasi Kepada yang membutuhkan",
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
                                Text("Mari membantu sesama yang sedang kesulitan akibat dari Covid-19",
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
                                  title: const Text('Pasien Covid-19'),
                                  leading: Radio<Sasaran>(
                                    value: Sasaran.PasienCovid,
                                    groupValue: _character,
                                    onChanged: (Sasaran? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('Bantuan Sosial'),
                                  leading: Radio<Sasaran>(
                                    value: Sasaran.BantuanSosial,
                                    groupValue: _character,
                                    onChanged: (Sasaran? value) {
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
                                const Text("Nominal Donasi",
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
                                TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: "Rp 5000",
                                    labelText: "",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the title';
                                    }
                                    nomin = value;
                                    return null;
                                  },
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
                                const Text("Pilih Metode Pembayaran",
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
                                  title: const Text('OVO'),
                                  leading: Radio<pay>(
                                    value: pay.ovo,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('Gopay'),
                                  leading: Radio<pay>(
                                    value: pay.gopay,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('Dana'),
                                  leading: Radio<pay>(
                                    value: pay.dana,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('BCA'),
                                  leading: Radio<pay>(
                                    value: pay.bca,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('BNI'),
                                  leading: Radio<pay>(
                                    value: pay.bni,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('BRI'),
                                  leading: Radio<pay>(
                                    value: pay.bri,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
                                      });
                                    },
                                  ),
                                ),

                                ListTile(
                                  title: const Text('Mandiri'),
                                  leading: Radio<pay>(
                                    value: pay.mandiri,
                                    groupValue: _pilihan,
                                    onChanged: (pay? value) {
                                      setState(() {
                                        _pilihan = value;
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

                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15),
                            primary: Colors.blueGrey,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),),

                          onPressed: () {
                            if (_formKey.currentState!.validate() && nomin!="") {
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