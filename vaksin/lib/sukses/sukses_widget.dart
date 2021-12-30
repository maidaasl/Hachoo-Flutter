import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuksesWidget extends StatefulWidget {
  SuksesWidget({Key key}) : super(key: key);

  @override
  _SuksesWidgetState createState() => _SuksesWidgetState();
}

class _SuksesWidgetState extends State<SuksesWidget> {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          'Hachoo',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.title3.override(
            fontFamily: 'Rubik',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),


      // Drawer


      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 10),
              child: Text(
                'Booking jadwal vaksinasimu berhasil!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
              child: Text(
                'Kamu sudah terdaftar sebagai pasien vaksinasi, Jaga terus kesehatanmu sebelum vaksinasi agar menghindari kejadian yang tidak kita inginkan.\nLindungi terus diri dan keluargamu dari Virus COVID-19! Jangan kendor!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
              child: Text(
                'Tetap jaga jarak, hindari kerumunan, dan patuhi terus protokol kesehatan yang berlaku!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
              child: Text(
                'Sampaikan salam dari kami, Kelompok TK PBP C10 selaku Developer Hachoo kepada kelargamu.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
