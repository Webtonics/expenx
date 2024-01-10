import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Box? transaction;
  // final box = Hive.box('transaction');
  
  @override
  void initState() {
   Hive.openBox("transaction").then((value){
    setState(() {
      transaction = value;
    });
   }
   );
  
   print('success');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("EXPENX"),
      ),
      // body: buildUi(),
      body: Center(),
    );
  }

  // Widget buildUi(){
  //   if (transaction == null) {
  //     return CircularProgressIndicator();
  //   }else{
  //     return ValueListenableBuilder(
  //       valueListenable: transaction!.listenable(), 
  //       builder: (context, box, Widget){
  //        return  Center();
  //     });
  //   }
  // }
}