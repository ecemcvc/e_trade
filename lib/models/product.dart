class Product{
  late int _id;
  late String _name;
  late String _description;
  late double _price;


  Product(this._name, this._description, this._price);

  Product.withId(this._id, this._name, this._description, this._price);

  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String value) {
    if (value.length >= 2) {
      _name = value;
    }
  }

  set description(String value) {
    if (value.length >= 10) {
      _description = value;
    }
  }

  set price(double value) {
    if (value > 0) {
      _price = value;
    }
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["Name"] = _name;
    map["Description"] = _description;
    map["Price"] = _price;   
    return map;
  }

    Product.fromMap(Map<String, dynamic> map) {
    _id = map["Id"];
    _name = map["Name"];
    _description = map["Description"];
    _price = map["Price"];
  }
}

