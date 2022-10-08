// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/describtion.dart';
import 'package:flutter_application_1/Screens/read.dart';
import '../Comm/Toast.dart';
import '../Comm/defaultplan.dart';
import '../Comm/textField.dart';

class dia extends StatefulWidget {
  Map<String, String> mp = {};
  dia({this.mp});
  @override
  _diaState createState() => _diaState();
}

class _diaState extends State<dia> {
  Map<String, dynamic> data;

  FocusNode fsphr = FocusNode();
  FocusNode fsphl = FocusNode();
  FocusNode fcylr = FocusNode();
  FocusNode fcyll = FocusNode();
  FocusNode faxr = FocusNode();
  FocusNode faxl = FocusNode();

  @override
  void initState() {
    super.initState();
    tsphr.text = '';
    tsphl.text = '';
    tcylr.text = '';
    tcyll.text = '';
    taxr.text = '';
    taxl.text = '';
    addr.text = '';
    addl.text = '';
    prism1r.text = '';
    prism1l.text = '';
    prism2r.text = '';
    prism2l.text = '';
    base1r.text = '';
    base1l.text = '';
    base2r.text = '';
    base2l.text = '';
    readr.text = '';
    readl.text = '';
    farr.text = '';
    farl.text = '';
    fcdr.text = '';
    fcdl.text = '';
    pa.text = '';
    fffa.text = '';
    fsphr.addListener(() {
      if (!fsphr.hasFocus) {
        plus(tsphr, fsphr);
      }
    });
    fsphl.addListener(() {
      if (!fsphl.hasFocus) {
        plus(tsphl, fsphl);
      }
    });
    fcylr.addListener(() {
      if (!fcylr.hasFocus) {
        plus(tcylr, fcylr);
      }
    });
    fcyll.addListener(() {
      if (!fcyll.hasFocus) {
        plus(tcyll, fcyll);
      }
    });
    faxr.addListener(() {
      if (!faxr.hasFocus) {
        ax(taxr, faxr);
      }
    });
    faxl.addListener(() {
      if (!faxl.hasFocus) {
        ax(taxl, faxl);
      }
    });
  }

  final tsphr = TextEditingController();
  final tsphl = TextEditingController();
  final tcylr = TextEditingController();
  final tcyll = TextEditingController();
  final taxr = TextEditingController();
  final taxl = TextEditingController();

  final addr = TextEditingController();
  final addl = TextEditingController();
  final prism1r = TextEditingController();
  final prism1l = TextEditingController();
  final prism2r = TextEditingController();
  final prism2l = TextEditingController();
  final base1r = TextEditingController();
  final base1l = TextEditingController();
  final base2r = TextEditingController();
  final base2l = TextEditingController();

  final readr = TextEditingController();
  final readl = TextEditingController();
  final farr = TextEditingController();
  final farl = TextEditingController();

  final fcdr = TextEditingController();
  final fcdl = TextEditingController();
  final pa = TextEditingController();
  final fffa = TextEditingController();

  Widget button() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
        child: Text(
          'التالى',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (((tsphr.text == "") && (tsphl.text == ""))) {
            alertDilog(context, "You have to enter sphere");
          } else {
            widget.mp['tsphr'] = tsphr.text;
            widget.mp['tsphl'] = tsphl.text;
            widget.mp['tcylr'] = tcylr.text;
            widget.mp['tcyll'] = tcyll.text;
            widget.mp['taxr'] = taxr.text;
            widget.mp['taxl'] = taxl.text;
            widget.mp['addr'] = addr.text;
            widget.mp['addl'] = addl.text;
            widget.mp['prism1r'] = prism1r.text;
            widget.mp['prism1l'] = prism1l.text;
            widget.mp['prism2r'] = prism2r.text;
            widget.mp['prism2l'] = prism2l.text;
            widget.mp['base1r'] = base1r.text;
            widget.mp['base1l'] = base1l.text;
            widget.mp['base2r'] = base2r.text;
            widget.mp['base2l'] = base2l.text;
            widget.mp['readr'] = readr.text;
            widget.mp['readl'] = readl.text;
            widget.mp['farr'] = farr.text;
            widget.mp['farl'] = farl.text;
            widget.mp['fcdr'] = fcdr.text;
            widget.mp['fcdl'] = fcdl.text;
            widget.mp['pa'] = pa.text;
            widget.mp['fffa'] = fffa.text;
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => describ(mp: widget.mp)));
          }
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
                  Titl(text: ": الوصفة الطبية"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(width: 10),
                            costumTF(
                              contr: taxr,
                              contl: taxl,
                              name1: "Axis",
                              fs: 0,
                              focus1: faxr,
                              focus2: faxl,
                              name2: "",
                            ),
                            costumTF(
                              contr: tcylr,
                              contl: tcyll,
                              name1: "CYL",
                              fs: 0,
                              name2: "",
                              focus1: fcylr,
                              focus2: fcyll,
                            ),
                            costumTF(
                              contr: tsphr,
                              contl: tsphl,
                              name1: "SPH",
                              fs: 0,
                              name2: "",
                              focus1: fsphr,
                              focus2: fsphl,
                            ),
                            SizedBox(width: 10),
                            RL(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(width: 10),
                            costumTF(
                              contr: addr,
                              contl: addl,
                              name1: "Add",
                              fs: 0,
                              name2: "",
                            ),
                            costumTF(
                              contr: prism1r,
                              contl: prism1l,
                              name1: "Prism",
                              fs: 0,
                              name2: "",
                            ),
                            costumTF(
                              contr: base1r,
                              contl: base1l,
                              name1: "Base",
                              fs: 0,
                              name2: "",
                            ),
                            SizedBox(width: 10),
                            RL(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(width: 10),
                            costumTF(
                              contr: prism2r,
                              contl: prism2l,
                              name1: "Prism",
                              fs: 0,
                              name2: "",
                            ),
                            costumTF(
                              contr: base2r,
                              contl: base2l,
                              name1: "Base",
                              fs: 0,
                              name2: "",
                            ),
                            SizedBox(width: 10),
                            RL(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Titl(text: ": المسافة بين العينين"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(width: 10),
                            costumTF(
                              contr: farr,
                              contl: farl,
                              name1: "للبعيد",
                              fs: 0,
                              name2: "",
                            ),
                            costumTF(
                              contr: readr,
                              contl: readl,
                              name1: "للقراْة",
                              fs: 0,
                              name2: "",
                            ),
                            SizedBox(width: 10),
                            RL(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Titl(text: ": القياسات الشخصية  "),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            costumTF1(
                              controller: fffa,
                              name: "FFFA",
                              fs: 0,
                            ),
                            SizedBox(width: 10),
                            costumTF1(
                              controller: pa,
                              name: "PA",
                              fs: 0,
                            ),
                            SizedBox(width: 10),
                            costumTF(
                              contr: fcdr,
                              contl: fcdl,
                              name1: "FCD",
                              fs: 0,
                              name2: "",
                            ),
                            SizedBox(width: 10),
                            RL(),
                          ],
                        ),
                      ],
                    ),
                  ),
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
