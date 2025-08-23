import 'package:flutter/material.dart';
import 'package:mysff_flutter/core/services/user_services.dart';
import 'package:mysff_flutter/core/types/user.dart';
import 'package:mysff_flutter/screens/Home/viewmodel/user_viewmodel.dart';

class HomeScreenViewModel extends ChangeNotifier {
  // Add your properties and methods here
  final UserViewModel userViewModel;

  HomeScreenViewModel(this.userViewModel);

  Future<String> getCustInfo() async {
    // Example method to load user data
    String? custUrl = await UserServices.getCustInfo();
    notifyListeners();
    return custUrl ?? '';
  }
}