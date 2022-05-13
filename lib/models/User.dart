class User {
  String? email;
  int? id;
  bool? isVerified;
  String? phone;
  String? role;
  String? username;

  User(
      {this.email,
      this.id,
      this.isVerified,
      this.phone,
      this.role,
      this.username});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    isVerified = json['is_verified'];
    phone = json['phone'];
    role = json['role'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['is_verified'] = isVerified;
    data['phone'] = phone;
    data['role'] = role;
    data['username'] = username;
    return data;
  }

}
