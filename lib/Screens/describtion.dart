// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/pdf.dart';
import 'package:flutter_application_1/Screens/read.dart';
import '../Comm/Toast.dart';
import '../Comm/defaultplan.dart';
import '../Comm/dropdown.dart';
import '../Comm/textField.dart';
import 'package:intl/intl.dart';

class describ extends StatefulWidget {
  Map<String, String> mp = {};
  describ({this.mp});
  @override
  _describState createState() => _describState();
}

class _describState extends State<describ> {
  Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    ehr.text = '';
    ehl.text = '';
    fsize.text = '';
    fheigh.text = '';
    dbl.text = '';
  }

  final ehr = TextEditingController();
  final ehl = TextEditingController();
  final fsize = TextEditingController();
  final fheigh = TextEditingController();
  final dbl = TextEditingController();

  String spr = "", spl = "", cyr = "", cyl = "", ar = "", al = "", ipd = "";
  String rw = "", di = "", ct = "1.2", br = "", bv = "12", ed = "2", ad = "";
  String aspr = "", aspl = "", acyr = "", acyl = "", aar = "", aal = "";
  String tspr = "", tspl = "", tcyr = "", tcyl = "", tar = "", tal = "";
  String cspr = "", cspl = "", ccyr = "", ccyl = "", car = "", cal = "";
  String conr = "", conl = "";

  double sphr, sphl, cyll, cylr, axl, h, axr, F, cylcr, sphcr, cylcl, sphcl;
  double d = 0;

  bool r = false, l = false;
  String _selected;
  final List<Map> _myJson = [
    {"id": '1', "image": "assets/Lens1.png"},
    {"id": '2', "image": "assets/Lens2.png"},
    {"id": '3', "image": "assets/Lens3.png"},
    {"id": '4', "image": "assets/Lens4.png"},
    {"id": '5', "image": "assets/Lens5.png"},
    {"id": '6', "image": "assets/Lens6.png"},
    {"id": '7', "image": "assets/Lens7.png"},
    {"id": '8', "image": "assets/Lens8.png"},
    {"id": '9', "image": "assets/Lens9.png"},
  ];
  List<String> material = ['معدن', 'بلاستيك', 'نصف إطار', 'بدون إطار'];
  String _selecte = 'معدن';

  Widget button() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
        child: Text(
          'تأكيد',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          widget.mp['type'] = _selecte;
          widget.mp['ehr'] = ehr.text;
          widget.mp['ehl'] = ehl.text;
          widget.mp['fsize'] = fsize.text;
          widget.mp['fheigh'] = fheigh.text;
          widget.mp['dbl'] = dbl.text;
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          final String date = formatter.format(DateTime.now());
          widget.mp['date'] = date;
          // DateTime.now(),
          final pdfFile = await PdfInvoiceApi.generate(widget.mp);
          PdfApi.openFile(pdfFile);
        },
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Navigation bar
            statusBarColor: Color.fromARGB(156, 9, 9, 9), // Status bar
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'SEIKO طلب عدسة',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Titl(text: ": إرتفاع العينين  "),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            costumTF1(
                              controller: ehr,
                              name:
                                  "إرتفاع العين اليمنى عن حافة الإطار من اسفل",
                              fs: 0,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            costumTF1(
                              controller: ehl,
                              name:
                                  "إرتفاع العين اليسرى عن حافة الإطار من اسفل",
                              fs: 0,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Titl(text: ": قياسات الإطار  "),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            costumT(
                              controller: fsize,
                              name: "(A)  حجم الإطار",
                              fs: 0,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            costumT(
                              controller: fheigh,
                              name: "(B)  إرتفاع الإطار",
                              fs: 0,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            costumT(
                              controller: dbl,
                              name: "(DBL)  المسافة بين العدستين",
                              fs: 0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset("assets/Lens.png"),
                  SizedBox(height: 20),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 5.5),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              height: 80,
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                iconSize: 40,
                                itemHeight: 90,
                                isDense: true,
                                hint: const Text("شكل الإطار",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                value: _selected,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _selected = newValue;
                                    int x = int.parse(_selected);
                                    String z = _myJson[x]['image'];
                                    widget.mp['img'] = _myJson[x]['image'];
                                    print(widget.mp['img']);
                                  });
                                },
                                items: _myJson.map((Map map) {
                                  return DropdownMenuItem<String>(
                                    value: map["id"].toString(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          map["image"],
                                          width: 150,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 5.5),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              height: 80,
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                iconSize: 40,
                                itemHeight: 90,
                                isDense: true,
                                value: _selecte,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _selecte = newValue;
                                    widget.mp['type'] = _selecte;
                                    print(widget.mp['type']);
                                  });
                                },
                                items: material.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  button(),
                ],
              ),
            ),
          ),
        ));
  }

  void plus(TextEditingController t, FocusNode f) {
    String x = t.text;
    if (x != "") {
      double mx = double.parse(x);
      if ((mx % 0.25 != 0)) {
        alertDialog(context, "Please enter a number divisible by 0.25");
        f.requestFocus();
      }
      if ((mx > 20) || (mx < -20)) {
        alertDialog(
            context, "You can't enter number more than 20 or less than -20");
        f.requestFocus();
      }
      x = mx.toStringAsFixed(2);
      String y = x[0];
      if (!(y == '-') && !(y == '+')) {
        x = "+" + x;
      }
    }
    setState(() {
      t.text = x;
    });
  }

  void ax(TextEditingController l, FocusNode f) {
    if (l.text == "") {
    } else if (double.parse(l.text) > 180) {
      f.requestFocus();
      alertDialog(context, "Axis can't be more than 180 degree");
      FocusScopeNode currentFocus = FocusScope.of(context);
    }
  }
}
