import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Box? transaction;
  final transaction =  Hive.openBox('transaction');
  // final trans = Hive.box('transaction');
   double wallet = 0.0;

  @override
  void initState() {
  //  Hive.openBox("wallet").then((box){
  //   setState(() {
  //     transaction = box;
  //   });
  //  }
  
  //  );
   
   print('success');
    super.initState();
  }
  
  // Future<void> add( double amount, bool isIncome)async{
  //   if (isIncome = true) {
  //       wallet = wallet + amount;
  //       transaction!.put('wallet', wallet);
     
  //   }else{
  //     setState(() async {
  //       wallet = wallet - amount;
  //       await transaction!.put('wallet', wallet);
  //     });
  //   }
  // }

  
  //  get(){
  //   final tran = transaction!.get('wallet');
  //   return tran;
  // }
  // void update(){
  //   // transaction!.put('transaction', value)
  // }
  
  // Future <void> increase(){

  // }
  @override
  Widget build(BuildContext context) {
    // initwallet();
    return  FutureBuilder(
      future:  Hive.openBox('transaction'),
      builder: (context, snapshot){
         
      final transaction = snapshot.data;
        //make it listenable
        Widget buildUi(){
        return WatchBoxBuilder(box: Hive.box('transaction'), builder: (context, transaction){
        final data = transaction.get('first', defaultValue: 0.00 );
        return Text(data.toString());


    });
   
      
  }
        if (snapshot.hasData) {
        return Scaffold(
        appBar: AppBar(
          title: const Text("EXPENX"),
        ),
        // body: buildUi(),
        body: Center(child: Column(
          children: [
            buildUi(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (){
                transaction!.put('first',70.00);
                // transaction.watch();
              }, child: const Text("start")),
            ElevatedButton(onPressed: (){
                transaction!.delete('first',);
                // transaction.watch();
              }, child: const Text("delete")),
            ElevatedButton(onPressed: (){
                transaction!.put('first', 100);
                // transaction.watch();
              }, child: const Text("update"))
              ],
            )
          ],
        )),
        
      );
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      }
      
    );
  }

//   Widget buildUi(){
//     if (transaction == null) {
//       return const CircularProgressIndicator();
//     }else{
//       return ValueListenableBuilder(
//         valueListenable: transaction!.listenable(), 
//         builder: (context, box, Widget){
//          return   Center(
//           child: Column(
//             children: [
//               Text(get().toString()),
//               ElevatedButton(onPressed: (){
//                 add(50.00, false);
//               }, child: Text("TEST"))
//             ],
//           ),

//          );
      // });
    // }
  // }

  
}