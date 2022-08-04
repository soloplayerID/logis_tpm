class LoginResponse {
  bool? status;
  Data? data;

  LoginResponse({this.status, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? idUser;
  String? region;
  String? username;
  String? role;
  String? roleName;
  String? token;

  Data(
      {this.idUser,
      this.region,
      this.username,
      this.role,
      this.roleName,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    region = json['region'];
    username = json['username'];
    role = json['role'];
    roleName = json['role_name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['region'] = region;
    data['username'] = username;
    data['role'] = role;
    data['role_name'] = roleName;
    data['token'] = token;
    return data;
  }
}
