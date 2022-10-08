// @dart = 2.9
class UserModel {
  int id;
  String name;
  String adress;
  String pnum;
  int submite;

  UserModel(this.id, this.name, this.adress, this.pnum, this.submite);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'adress': adress,
      'phone_num': pnum,
      'submite': submite,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    adress = map['adress'];
    pnum = map['phone_num'];
    submite = map['submite'];
  }
}
