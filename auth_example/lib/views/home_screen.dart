import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/auth_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
    _loadToken();
  }

  void _loadToken() async{
    final viewModel = Provider.of<AuthViewModel>(context, listen:false);
    final saveToken = await viewModel.getToken();
    setState(() {
      var token = saveToken ;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }