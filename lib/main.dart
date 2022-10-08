// @dart = 2.9
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/describtion.dart';
import 'package:flutter_application_1/Screens/diagnose.dart';
import 'Comm/Toast.dart';
import 'Comm/button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Comm/dropdown.dart';
import 'Comm/textField.dart';
import 'DatabaseHandler/DbHelper.dart';
import 'Model/UserModel.dart';
import 'Screens/read.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List list;
  Map<String, String> mp;
  MyHomePage({Key key, this.list, this.mp}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = ['SEIKO', 'Star Vision'];
  List<String> lensType = [];
  String dropdownValue = 'SEIKO';
  String data = 'Rx Single Vision';
  String condition;

  getList() {
    lensType.clear();
    for (int i = 0; i < widget.list.length; i++) {
      if (!(lensType.contains(widget.list[i]['case']))) {
        lensType.add(widget.list[i]['case']);
      }
    }
    data = lensType.first;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "مرحبا بكم فى شركة SEIKO",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dropdown(
                      title: "الماركة",
                      items: items,
                      dpValue: dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      }),
                ],
              ),
              SizedBox(height: 30),
              button(
                  text: "التالى",
                  onPressed: () {
                    getList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => brand(
                                data: data,
                                condition: condition,
                                lensType: lensType,
                                mp: widget.mp,
                                list: widget.list)));
                  }),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();
  var dbHelper;

  Map<String, String> mp = {};

  login() async {
    int id = 1;
    await dbHelper.getLoginUser(id).then((userData) {
      if (userData != null) {
        setSP(userData).whenComplete(() {
          getUserData();
          Timer(
              Duration(seconds: 3),
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(list: list, mp: mp))));
        });
      } else {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => submition(list: list))));
      }
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: Login Fail");
    });
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString('name', user.name);
    sp.setString('adress', user.adress);
    sp.setString('phone_num', user.pnum);
    sp.setInt('submite', user.submite);
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      mp['name'] = sp.getString('name');
      mp['adress'] = sp.getString('adress');
      mp['pnum'] = sp.getString('phone_num');
      mp['submit'] = sp.getInt('submite').toString();
    });
  }

  List list = [];
  Future ReadData() async {
    var url = "https://mysqlflutterapp.000webhostapp.com/fun/readData.php";
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      print(red);
      setState(() {
        list.addAll(red);
      });
    }
  }

  getData() async {
    await ReadData();
  }

  @override
  void initState() {
    super.initState();
    getData();
    dbHelper = DbHelper();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/logo.jpg",
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class submition extends StatefulWidget {
  List list;
  submition({Key key, this.list}) : super(key: key);

  @override
  State<submition> createState() => _submitionState();
}

class _submitionState extends State<submition> {
  Map<String, String> mp = {};
  final _formKey = new GlobalKey<FormState>();
  final _conName = TextEditingController();
  final _conAdress = TextEditingController();
  final _conPNum = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    int id = 1;
    String name = _conName.text;
    String adress = _conAdress.text;
    String pnum = _conPNum.text;
    int submite = 1;

    mp['name'] = _conName.text;
    mp['adress'] = _conAdress.text;
    mp['pnum'] = _conPNum.text;
    mp['submit'] = '1';

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      UserModel uModel = UserModel(id, name, adress, pnum, submite);
      await dbHelper.saveData(uModel).then((userData) {
        alertDialog(context, "Successfully Saved");

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MyHomePage(list: widget.list, mp: mp)));
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Data Save Fail");
      });
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
        title: Text(
          "Welcome to SEIKO Price List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textfield(text: 'أسم المحل', controller: _conName),
                    SizedBox(height: 10.0),
                    textfield(text: 'العنوان', controller: _conAdress),
                    SizedBox(height: 10.0),
                    textfield(text: 'رقم التيليفون', controller: _conPNum),
                    button(text: 'تأكيد', onPressed: signUp)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
