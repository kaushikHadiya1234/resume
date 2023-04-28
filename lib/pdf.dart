import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:prectics/ResumeModal.dart';
import 'package:printing/printing.dart';

Future<Uint8List> pdfMaker(ResumeModal d1) async {
  var pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.varelaRoundRegular(),
        bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      margin: pw.EdgeInsets.all(8),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Center(
          child: pw.Stack(
            children: [
              pw.Column(
                children: [
                  pw.SizedBox(height: 60),
                  pw.Container(
                    height: 150,
                    width: double.infinity,
                    decoration: pw.BoxDecoration(color: PdfColors.red200),
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 200),
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "${d1.name}",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 30,
                                letterSpacing: 2),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    height: 785,
                    width: 150,
                    margin: pw.EdgeInsets.only(left: 35),
                    decoration: pw.BoxDecoration(color: PdfColors.blueGrey200),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 75),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 10),
                          child: pw.ClipOval(
                            child: pw.Image(pw.MemoryImage(
                                File("${d1.img}").readAsBytesSync())),
                          ),
                        ),
                        pw.SizedBox(height: 60),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(left: 15),
                          child: pw.Text("PROFILE",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 1)),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.only(left: 15, right: 15),
                          child: pw.Text(
                              "Business Administration studunt.\n"
                              "I consider my self a responsible and orderly person.\n"
                              "I am looking forword for my frist work experience.",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                        ),
                        pw.SizedBox(height: 15),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(left: 15),
                          child: pw.Text("CONTACT ME",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1)),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 15),
                          child: pw.Row(
                            children: [
                              pw.Icon(
                                pw.IconData(0xe0b0),
                                color: PdfColors.white,
                              ),
                              pw.SizedBox(width: 5),
                              pw.Text("${d1.cno}",
                                  style: pw.TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 13,
                                      letterSpacing: 1)),
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 15),
                          child: pw.Row(
                            children: [
                              pw.Icon(
                                pw.IconData(0xe158),
                                color: PdfColors.white,
                              ),
                              pw.SizedBox(width: 5),
                              pw.Container(
                                  height: 50,
                                  width: 90,
                                  child: pw.Text("${d1.email}",
                                      style: pw.TextStyle(
                                          color: PdfColors.white,
                                          fontSize: 13,
                                          letterSpacing: 1))),
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 15),
                          child: pw.Row(
                            children: [
                              pw.Icon(
                                pw.IconData(0xe0c8),
                                color: PdfColors.white,
                              ),
                              pw.SizedBox(width: 5),
                              pw.Text("${d1.add}",
                                  style: pw.TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 13,
                                      letterSpacing: 1)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              pw.Column(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 210, left: 187),
                    child: pw.Container(
                      height: 580,
                      width: 210,
                      decoration: pw.BoxDecoration(color: PdfColors.white),
                      child: pw.Column(
                        children: [
                          pw.SizedBox(height: 40),
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 15),
                            child: pw.Row(
                              children: [
                                pw.Icon(
                                  pw.IconData(0xe163),
                                  color: PdfColors.grey,
                                ),
                                pw.SizedBox(width: 10),
                                pw.Text(
                                  "EDUCATION",
                                  style: pw.TextStyle(
                                      color: PdfColors.black,
                                      letterSpacing: 1,
                                      fontSize: 17,
                                      fontWeight: pw.FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Align(
                            alignment: pw.Alignment.centerLeft,
                            child: pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: pw.Text(
                                  "${d1.filled}",
                                  style: pw.TextStyle(
                                      color: PdfColors.black,
                                      letterSpacing: 1,
                                      fontSize: 15),
                                )),
                          ),
                          pw.SizedBox(height: 40),
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 15),
                            child: pw.Row(
                              children: [
                                pw.Icon(
                                  pw.IconData(0xe163),
                                  color: PdfColors.grey,
                                ),
                                pw.SizedBox(height: 40),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.Row(
                                    children: [
                                      pw.Icon(
                                        pw.IconData(0xe163),
                                        color: PdfColors.grey,
                                      ),
                                      pw.SizedBox(width: 10),
                                      pw.Text(
                                        "WORK EXPERIENCE",
                                        style: pw.TextStyle(
                                            color: PdfColors.black,
                                            letterSpacing: 1,
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Align(
                                  alignment: pw.Alignment.centerLeft,
                                  child: pw.Padding(
                                      padding: const pw.EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: pw.Text(
                                        "${d1.f}",
                                        style: pw.TextStyle(
                                            color: PdfColors.black,
                                            letterSpacing: 1,
                                            fontSize: 15),
                                      )),
                                ),
                                pw.SizedBox(height: 40),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.Row(
                                    children: [
                                      pw.Icon(
                                        pw.IconData(0xe163),
                                        color: PdfColors.grey,
                                      ),
                                      pw.SizedBox(width: 10),
                                      pw.Text(
                                        "EXPECTED SALARY",
                                        style: pw.TextStyle(
                                            color: PdfColors.black,
                                            letterSpacing: 1,
                                            fontSize: 17,
                                            fontWeight: pw.FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                pw.SizedBox(height: 10),
                                pw.Align(
                                  alignment: pw.Alignment.centerLeft,
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: pw.Text(
                                      "${d1.R?.start.toInt()} - ${d1.R?.end.toInt()}",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          letterSpacing: 1,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
  return await pdf.save();
}
