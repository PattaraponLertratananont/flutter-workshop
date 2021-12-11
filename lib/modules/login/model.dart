class UserModel {
  String name;
  String phoneNumber;

  UserModel(
    String name,
    String phoneNumber,
  )   : name = name,
        phoneNumber = phoneNumber;

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        phoneNumber = json["phone"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["phone"] = phoneNumber;
    return data;
  }
}
