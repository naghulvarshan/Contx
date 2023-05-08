class Users {
  final int id;
  String name;
  String username;
  String email;
  String website;
  String address;
  String company;
  String phone;
  Users(this.id, this.name, this.username, this.email, this.website,
      this.address, this.company, this.phone);
  factory Users.fromjson(Map<String, dynamic> json) {
    return Users(
        json['id'] ?? "FNAME",
        json['name'] ?? "LNAME",
        json['username'] ?? "UNAME",
        json['email'] ?? "@",
        json['website'] ?? "@",
        json['address']['street'] ?? "@",
        json['company']['name'] ?? "@",
        json['phone'] ?? "0");
  }
}
