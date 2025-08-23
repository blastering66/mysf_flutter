import 'package:flutter/material.dart';
import 'package:mysff_flutter/screens/Home/viewmodel/homeviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:mysff_flutter/screens/Home/viewmodel/user_viewmodel.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTabScreen> {
  final homeVM = HomeScreenViewModel(UserViewModel());
  String urlCust = 'loading...';

  Future<void> fetchCustInfo() async {
    final cust = await homeVM.getCustInfo();
    setState(() {
      urlCust = cust;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCustInfo();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    // final homeViewModel = context.watch<HomeScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Tab'),
      ),
      body: Column(
        children: 
       [ Center(
        child: Text('Welcome to the Home Mr.${userViewModel.getCurrentUser?.mdn}!'),
      ),Center(
        child: Text('Welcome to the Home Mr!${urlCust}'),
      )]


      ),
    );
  }
}