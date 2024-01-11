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
   Hive.openBox("transaction").then((box){
    setState(() {
      transaction = box;
    });
   }
   );
  
   print('success');
    super.initState();
  }
  void add(){
    transaction!.put('transaction', '200');
  }
   get(){
    final tran = transaction!.get('transaction');
    return tran;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("EXPENX"),
      ),
      body: buildUi(),
      // body: const Center(
      //   child: Column(
          
      //   ),
      // ),
    );
  }

  Widget buildUi(){
    if (transaction == null) {
      return const CircularProgressIndicator();
    }else{
      return ValueListenableBuilder(
        valueListenable: transaction!.listenable(), 
        builder: (context, box, Widget){
         return   Center(
          child: Column(
            children: [
              Text(get().toString()),
              ElevatedButton(onPressed: (){
                add();
              }, child: Text("TEST"))
            ],
          ),

         );
      });
    }
  }
}