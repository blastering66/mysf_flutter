typedef JsonMap = Map<String, dynamic>;

class User {
  String? name;
  String? email;
  String? mdn;
  String? sessionId;
  String? refresh_token;

  User({
    required this.mdn,
    required this.email,
    this.name,
    this.sessionId,
    this.refresh_token,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mdn = json['mdn'];
    sessionId = json['session_id'];
    refresh_token = json['refresh_token'];
  }

  JsonMap toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['mdn'] = this.mdn;
    data['sessionId'] = this.sessionId;
    data['refresh_token'] = this.refresh_token;
    return data;
  }
}