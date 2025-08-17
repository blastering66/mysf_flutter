import 'package:flutter/foundation.dart';
import 'package:mysff_flutter/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  // final AuthService _authService = AuthService();
  // final UserService _userService = UserService();
  // final SharedPreferencesService _sharedPreferencesService = SharedPreferencesService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthViewModel () {
    // Initialize any necessary services here
    // _authService.initialize();
    // _userService.initialize();
    // _sharedPreferencesService.initialize();
    print('_loadLoginState........');
    _loadLoginState();
  }

  Future<void> _loadLoginState() async {
    _setLoading(true);
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print('isLoggedIn...>>> $_isLoggedIn');
    notifyListeners();
    _setLoading(false);
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      // await _authService.login(email, password);
      String? token = await AuthService.login(email, password);
      print('Token >> $token');
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('session_id', token);
      } else {
        throw Exception('Invalid credentials');
      }
      _setLoggedIn(true);
      notifyListeners();
    
      
    } catch (e) {
      // Handle error
      print('Login failed: $e');
      _setLoggedIn(false);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      // await _authService.logout();
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('isLoggedIn');
      _setLoggedIn(false);
      notifyListeners();
      print('Logged out successfully');
    } catch (e) {
      // Handle error
      print('Logout failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}