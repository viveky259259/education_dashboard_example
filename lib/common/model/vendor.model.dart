class VendorModel {
  String _id;
  String _vendorId;
  String _materialId;
  String _material;
  String _vendorName;
  int _contactNo;
  String _email;
  String _location;
  String _address;

  VendorModel(
      {String id,
      String vendorId,
      String materialId,
      String material,
      String vendorName,
      int contactNo,
      String email,
      String location,
      String address}) {
    this._id = id;
    this._vendorId = vendorId;
    this._materialId = materialId;
    this._material = material;
    this._vendorName = vendorName;
    this._contactNo = contactNo;
    this._email = email;
    this._location = location;
    this._address = address;
  }

  String get id => _id;

  set id(String id) => _id = id;

  String get vendorId => _vendorId;

  set vendorId(String vendorId) => _vendorId = vendorId;

  String get materialId => _materialId;

  set materialId(String materialId) => _materialId = materialId;

  String get material => _material;

  set material(String material) => _material = material;

  String get vendorName => _vendorName;

  set vendorName(String vendorName) => _vendorName = vendorName;

  int get contactNo => _contactNo;

  set contactNo(int contactNo) => _contactNo = contactNo;

  String get email => _email;

  set email(String email) => _email = email;

  String get location => _location;

  set location(String location) => _location = location;

  String get address => _address;

  set address(String address) => _address = address;

  VendorModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _vendorId = json['vendor_id'];
    _materialId = json['material_id'];
    _material = json['material'];
    _vendorName = json['vendor_name'];
    _contactNo = json['contact_no'];
    _email = json['email'];
    _location = json['location'];
    _address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['vendor_id'] = this._vendorId;
    data['material_id'] = this._materialId;
    data['material'] = this._material;
    data['vendor_name'] = this._vendorName;
    data['contact_no'] = this._contactNo;
    data['email'] = this._email;
    data['location'] = this._location;
    data['address'] = this._address;
    return data;
  }
}
