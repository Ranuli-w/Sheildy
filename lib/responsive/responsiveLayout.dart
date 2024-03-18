import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shieldy/providers/UserProvider.dart';
import 'package:shieldy/utils/dimension.dart';


class responsiveLayout extends StatefulWidget {

  final Widget webScreenLayout;
  final Widget mobileScreenLayout; 

  const responsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});

  @override
  State<responsiveLayout> createState() => _responsiveLayoutState();
}

class _responsiveLayoutState extends State<responsiveLayout> {

@override
  void initState() {
    super.initState();
    addData();
  }


  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >webScreenSize) {
          return widget.webScreenLayout;

          //webScreenSize

          
        
        }
          return widget.mobileScreenLayout;
        //mobileScreenSize
        
      }
    );
  }
}