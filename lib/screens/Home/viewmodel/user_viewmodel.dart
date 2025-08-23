import 'package:flutter/foundation.dart';
import 'package:mysff_flutter/core/types/user.dart';

class UserViewModel extends ChangeNotifier {
  User? _currentUser;

  User? get getCurrentUser => _currentUser;

  bool get hasUser => _currentUser != null;

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }
} 