//@dart = 2.9
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';

class PdfInvoiceApi {
  static Future<File> generate(Map mp) async {
    var data = await rootBundle.load("assets/fonts/Arial.ttf");
    var myFont = Font.ttf(data);

    text({
      String value,
    }) {
      return Container(
        width: 25 * PdfPageFormat.mm,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 2 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    describ6({
      String value,
    }) {
      return Container(
        width: 15 * PdfPageFormat.mm,
        height: 7 * PdfPageFormat.mm,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 10 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    describ({
      String value,
    }) {
      return Container(
        width: 15 * PdfPageFormat.mm,
        height: 7 * PdfPageFormat.mm,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 10 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    describ7({
      String value,
    }) {
      return Container(
        width: 15 * PdfPageFormat.mm,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 8, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 2 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    describ5({
      String value,
    }) {
      return Center(
          child: Container(
        width: 15 * PdfPageFormat.mm,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 8, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 2 * PdfPageFormat.mm),
            ],
          ),
        ),
      ));
    }

    describ2({
      String value,
    }) {
      return Center(
        child: Container(
          width: 25 * PdfPageFormat.mm,
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 2 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    describ3({
      String value,
    }) {
      return Center(
        child: Container(
          width: 80 * PdfPageFormat.mm,
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 2 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    describ4({
      String value,
    }) {
      return Center(
        child: Container(
          width: 40 * PdfPageFormat.mm,
          height: 7 * PdfPageFormat.mm,
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 2 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    ntext({
      String value,
    }) {
      return Container(
        width: 50 * PdfPageFormat.mm,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 12, font: myFont),
                  textDirection: pw.TextDirection.rtl),
              SizedBox(width: 1.5 * PdfPageFormat.mm),
            ],
          ),
        ),
      );
    }

    Widget costumer() {
      return Container(
        margin: EdgeInsets.all(15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                Text('SEIKO',
                    style: TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 50)),
                Text('Precision for Vision',
                    style:
                        TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16))
              ]),
              Table(
                border: TableBorder.all(style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: <Widget>[
                    ntext(value: " "),
                    text(value: '?????? ????????????:	'),
                  ]),
                  TableRow(children: [
                    ntext(value: mp['name']),
                    text(value: '?????? ??????????:	'),
                  ]),
                  TableRow(children: [
                    ntext(value: mp['adress']),
                    text(value: '??????????????:	'),
                  ]),
                  TableRow(children: [
                    ntext(value: mp['pnum']),
                    text(value: '?????? ??????????????:	'),
                  ]),
                  TableRow(children: [
                    ntext(value: ''),
                    text(value: '?????? ??????????:	'),
                  ]),
                  TableRow(children: [
                    ntext(value: mp['date']),
                    text(value: '??????????????:	'),
                  ]),
                ],
              ),
            ]),
      );
    }

    Widget lensinfo() {
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Table(
          border: TableBorder.all(style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: <Widget>[
              describ(value: '?????? ????????????'),
              describ(value: '??????????????'),
              describ6(value: '?????????? ????????????????'),
              describ6(value: '?????????? ??????????????'),
              describ6(value: '?????????????? ??????????'),
              describ(value: '?????????? ??????'),
              describ(value: '?????? ??????????'),
            ]),
            TableRow(children: [
              describ7(value: mp['case']),
              describ7(value: mp['design']),
              describ5(value: mp['index']),
              describ5(value: mp['coat']),
              describ5(value: mp['treat']),
              describ7(value: mp['trp']),
              describ7(value: mp['cyl']),
            ]),
          ],
        ),
      );
    }

    Widget drug() {
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Table(
          border: TableBorder.all(style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: <Widget>[
              describ(value: '   '),
              describ(value: 'SPH'),
              describ(value: 'CYL'),
              describ(value: 'Axis'),
              describ(value: 'Add'),
              describ(value: 'Prism'),
              describ(value: 'Base'),
              describ(value: 'Prism'),
              describ(value: 'Base'),
            ]),
            TableRow(children: [
              describ(value: '????????????'),
              describ(value: mp['tsphr']),
              describ(value: mp['tcylr']),
              describ(value: mp['taxr']),
              describ(value: mp['addr']),
              describ(value: mp['prism1r']),
              describ(value: mp['base1r']),
              describ(value: mp['prism2r']),
              describ(value: mp['base2r']),
            ]),
            TableRow(children: [
              describ(value: '????????????'),
              describ(value: mp['tsphl']),
              describ(value: mp['tcyll']),
              describ(value: mp['taxl']),
              describ(value: mp['addl']),
              describ(value: mp['prism1l']),
              describ(value: mp['base1l']),
              describ(value: mp['prism2l']),
              describ(value: mp['base2l']),
            ]),
          ],
        ),
      );
    }

    Widget title() {
      return Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          Text('?????????? ?????? ??????????',
              style: TextStyle(fontSize: 30, font: myFont),
              textDirection: pw.TextDirection.rtl),
          SizedBox(width: 2 * PdfPageFormat.mm),
        ],
      );
    }

    Widget subtitle(String s) {
      return Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          Text(s,
              style: TextStyle(fontSize: 20, font: myFont),
              textDirection: pw.TextDirection.rtl),
          SizedBox(width: 2 * PdfPageFormat.mm),
        ],
      );
    }

    Widget FCD() {
      return Container(
        margin: EdgeInsets.all(15),
        child: Table(
          border: TableBorder.all(style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: <Widget>[
              describ(value: 'FCD'),
            ]),
            TableRow(children: [
              Table(
                border: TableBorder.all(style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: <Widget>[
                    describ(value: 'R'),
                    describ(value: 'L'),
                  ]),
                  TableRow(children: [
                    describ(value: mp['fcdr']),
                    describ(value: mp['fcdl']),
                  ]),
                ],
              ),
            ]),
          ],
        ),
      );
    }

    Widget PA() {
      return Table(
        border: TableBorder.all(style: BorderStyle.solid, width: 2),
        children: [
          TableRow(children: <Widget>[
            describ(value: 'PA'),
          ]),
          TableRow(children: [
            describ(value: mp['pa']),
          ]),
        ],
      );
    }

    Widget FFFA() {
      return Table(
        border: TableBorder.all(style: BorderStyle.solid, width: 2),
        children: [
          TableRow(children: <Widget>[
            describ(value: 'FFFA'),
          ]),
          TableRow(children: [
            describ(value: mp['fffa']),
          ]),
        ],
      );
    }

    Widget dist() {
      return Container(
        margin: EdgeInsets.all(15),
        child: Table(
          border: TableBorder.all(style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: <Widget>[
              describ(value: '????????????'),
              describ(value: '??????????????'),
              describ(value: '  '),
            ]),
            TableRow(children: [
              describ(value: mp['farr']),
              describ(value: mp['readr']),
              describ2(value: '?????????? ????????????'),
            ]),
            TableRow(children: [
              describ(value: mp['farl']),
              describ(value: mp['readl']),
              describ2(value: '?????????? ????????????'),
            ]),
          ],
        ),
      );
    }

    Widget contain() {
      return Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: <Widget>[
            FCD(),
            PA(),
            SizedBox(width: 5 * PdfPageFormat.mm),
            FFFA(),
            SizedBox(width: 5 * PdfPageFormat.mm),
          ]);
    }

    Widget contain2() {
      return Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: <Widget>[
            dist(),
          ]);
    }

    Widget tables() {
      return Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Table(
              border: TableBorder.all(style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: <Widget>[
                  describ(value: '???????????????? ??????????????'),
                ]),
                TableRow(children: [
                  contain(),
                ]),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Table(
              border: TableBorder.all(style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: <Widget>[
                  describ(value: '?????????????? ?????? ??????????????'),
                ]),
                TableRow(children: [
                  contain2(),
                ]),
              ],
            ),
          ),
        ],
      );
    }

    Widget eyehigh() {
      return Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Table(
              border: TableBorder.all(style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: <Widget>[
                  describ(value: mp['ehr']),
                  describ3(value: '???????????? ?????????? ???????????? ???? ???????? ???????????? ???? ????????'),
                ]),
                TableRow(children: [
                  describ(value: mp['ehl']),
                  describ3(value: '???????????? ?????????? ???????????? ???? ???????? ???????????? ???? ????????'),
                ]),
              ],
            ),
          ),
          SizedBox(width: 3 * PdfPageFormat.mm),
          subtitle('???????????? ??????????????'),
        ],
      );
    }

    Widget frame() {
      return Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Table(
              border: TableBorder.all(style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: <Widget>[
                  describ4(value: '(A) ?????? ????????????'),
                  describ4(value: '(B) ???????????? ????????????'),
                  describ4(value: '(DBL) ?????????????? ?????? ????????????????'),
                  describ4(value: '?????? ????????????'),
                ]),
                TableRow(children: [
                  describ(value: mp['fsize']),
                  describ(value: mp['fheigh']),
                  describ(value: mp['dbl']),
                  describ(value: mp['type']),
                ]),
              ],
            ),
          ),
          SizedBox(width: 2 * PdfPageFormat.mm),
        ],
      );
    }

    final ByteData bytes = await rootBundle.load(mp['img']);
    final Uint8List byteList = bytes.buffer.asUint8List();

    Widget frameShape() {
      return Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: pw.Image(
              pw.MemoryImage(
                byteList,
              ),
              width: 30 * PdfPageFormat.mm,
            ),
          ),
          SizedBox(width: 2 * PdfPageFormat.mm),
          subtitle('?????? ????????????'),
        ],
      );
    }

    final pdf = Document();
    pdf.addPage(pw.Page(
        build: (pw.Context context) => Column(children: <Widget>[
              costumer(),
              title(),
              subtitle('?????????????? ??????????????'),
              lensinfo(),
              subtitle('???????????? ????????????'),
              drug(),
              tables(),
              eyehigh(),
              subtitle('???????????? ????????????'),
              frame(),
              frameShape(),
            ])));

    return PdfApi.saveDocument(name: 'SEIKO Order.pdf', pdf: pdf);
  }
}

class PdfApi {
  static Future<File> saveDocument({
    String name,
    Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
