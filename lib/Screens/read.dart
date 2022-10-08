// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Comm/button.dart';
import '../Comm/dropdown.dart';
import 'diagnose.dart';

class brand extends StatefulWidget {
  Map<String, String> mp;
  String data;
  String condition;
  List<String> lensType;
  List list;
  brand({Key key, this.data, this.condition, this.lensType, this.list, this.mp})
      : super(key: key);

  @override
  State<brand> createState() => _brandState(data, condition);
}

class _brandState extends State<brand> {
  String data;
  String desi;
  String inde;
  String coat;
  String treat;
  String dvlt;
  String dvtrp;
  String trpo;
  String dvcyl;
  String cyli;
  String price;
  String dvtreat;
  String condition;
  String id;
  final TextEditingController desig = TextEditingController();
  final TextEditingController ind = TextEditingController();
  final TextEditingController lensTyp = TextEditingController();
  final TextEditingController coatin = TextEditingController();
  final TextEditingController treatmen = TextEditingController();
  final TextEditingController trpowe = TextEditingController();
  final TextEditingController cylinde = TextEditingController();
  String dvdesign;
  String dvind;
  String dvcoat;
  List<String> index = ["      "];
  List<String> coating = ["      "];
  List<String> treatment = ["      "];
  List<String> des = ["      "];
  List<String> cylinder = ["      "];
  List<String> trpower = ["      "];
  _brandState(this.data, this.condition);

  @override
  void initState() {
    super.initState();
    dvlt = (widget.lensType).first;
    data = (widget.lensType).first;
    setState(() {
      getDesign();
      getIndex();
      getCoat();
      getTreat();
      getTrp();
      getCyl();
      getPrice();
    });
  }

  getDesign() {
    des.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (data == widget.list[i]['case']) {
        if (!(des.contains(widget.list[i]['design']))) {
          des.add(widget.list[i]['design']);
        }
      }
    }
    dvdesign = des.first;
    desi = des.first;
  }

  getIndex() {
    index.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design'])) {
        if (!(index.contains(widget.list[i]['index']))) {
          index.add(widget.list[i]['index']);
        }
      }
    }
    dvind = index.first;
    inde = index.first;
  }

  getCoat() {
    coating.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index'])) {
        if (!(coating.contains(widget.list[i]['coat']))) {
          coating.add(widget.list[i]['coat']);
        }
      }
    }
    dvcoat = coating.first;
    coat = coating.first;
  }

  getTreat() {
    treatment.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat'])) {
        if (!(treatment.contains(widget.list[i]['treat']))) {
          treatment.add(widget.list[i]['treat']);
        }
      }
    }
    dvtreat = treatment.first;
    treat = treatment.first;
  }

  getTrp() {
    trpower.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat']) &&
          (treat == widget.list[i]['treat'])) {
        if (!(trpower.contains(widget.list[i]['trp']))) {
          trpower.add(widget.list[i]['trp']);
        }
      }
    }
    dvtrp = trpower.first;
    trpo = trpower.first;
  }

  getCyl() {
    cylinder.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat']) &&
          (trpo == widget.list[i]['trp']) &&
          (treat == widget.list[i]['treat'])) {
        if (!(cylinder.contains(widget.list[i]['cyl']))) {
          cylinder.add(widget.list[i]['cyl']);
        }
      }
    }
    dvcyl = cylinder.first;
    cyli = cylinder.first;
  }

  getPrice() {
    for (int i = 0; i < widget.list.length; i++) {
      if ((data == widget.list[i]['case']) &&
          (desi == widget.list[i]['design']) &&
          (inde == widget.list[i]['index']) &&
          (coat == widget.list[i]['coat']) &&
          (trpo == widget.list[i]['trp']) &&
          (cyli == widget.list[i]['cyl']) &&
          (treat == widget.list[i]['treat'])) {
        id = widget.list[i]['id'];
        price = widget.list[i]['price'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Navigation bar
          statusBarColor: Colors.black, // Status bar
        ),
        backgroundColor: Colors.black,
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
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        dropdown(
                            title: "نوع العدسة",
                            items: widget.lensType,
                            dpValue: dvlt,
                            onChanged: (String newValue) {
                              setState(() {
                                dvlt = newValue;
                                data = newValue;
                                getDesign();
                                getIndex();
                                getCoat();
                                getTreat();
                                getTrp();
                                getCyl();
                                getPrice();
                              });
                            }),
                        SizedBox(height: 10),
                        dropdown(
                            title: "التصميم",
                            items: des,
                            dpValue: dvdesign,
                            onChanged: (String newValue) {
                              setState(() {
                                dvdesign = newValue;
                                desi = newValue;
                                getIndex();
                                getCoat();
                                getTreat();
                                getTrp();
                                getCyl();
                                getPrice();
                              });
                            }),
                        SizedBox(height: 10),
                        dropdown(
                            title: "معامل الانكسار",
                            items: index,
                            dpValue: dvind,
                            onChanged: (String newValue) {
                              setState(() {
                                dvind = newValue;
                                inde = newValue;
                                getCoat();
                                getTreat();
                                getTrp();
                                getCyl();
                                getPrice();
                              });
                            }),
                        SizedBox(height: 10),
                        dropdown(
                            title: "طبقات الحماية",
                            items: coating,
                            dpValue: dvcoat,
                            onChanged: (String newValue) {
                              setState(() {
                                dvcoat = newValue;
                                coat = newValue;
                                getTreat();
                                getTrp();
                                getCyl();
                                getPrice();
                              });
                            }),
                        SizedBox(height: 10),
                        dropdown(
                            title: "معالجات الضوء",
                            items: treatment,
                            dpValue: dvtreat,
                            onChanged: (String newValue) {
                              setState(() {
                                dvtreat = newValue;
                                treat = newValue;
                                getTrp();
                                getCyl();
                                getPrice();
                              });
                            }),
                        SizedBox(height: 20),
                        dropdown(
                            title: "توتال بور",
                            items: trpower,
                            dpValue: dvtrp,
                            onChanged: (String newValue) {
                              setState(() {
                                dvtrp = newValue;
                                trpo = newValue;
                                getCyl();
                                getPrice();
                              });
                            }),
                        SizedBox(height: 20),
                        dropdown(
                            title: "حتى سلندر",
                            items: cylinder,
                            dpValue: dvcyl,
                            onChanged: (String newValue) {
                              setState(() {
                                dvcyl = newValue;
                                cyli = newValue;
                                getPrice();
                              });
                            }),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
                button(
                  text: "التالى",
                  onPressed: () {
                    widget.mp['case'] = data;
                    widget.mp['design'] = desi;
                    widget.mp['index'] = inde;
                    widget.mp['id'] = id;
                    widget.mp['condition'] = condition;
                    widget.mp['coat'] = coat;
                    widget.mp['treat'] = treat;
                    widget.mp['cyl'] = cyli;
                    widget.mp['trp'] = trpo;
                    widget.mp['price'] = price;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => dia(mp: widget.mp)));
                  },
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
