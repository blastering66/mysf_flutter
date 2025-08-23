import 'package:flutter_dotenv/flutter_dotenv.dart';

final custinfoUrl = dotenv.env['CUSTINFO'];

class UserServices {
  static Future<String?> getCustInfo() async {
    String url_ = custinfoUrl ?? 'aaa';
    return url_;
  }
}
