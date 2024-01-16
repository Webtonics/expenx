import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final transaction =  Hive.openBox('transaction');

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

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:  Hive.openBox('transaction'),
      builder: (context, snapshot){
         
          final transaction = snapshot.data;
          
            //make it listenable
          Widget buildUi(){
            return WatchBoxBuilder(box: Hive.box('transaction'), builder: (context, transaction){
            final data = transaction.get('first', defaultValue: 0.00 );
            double wallet = data;

            if (snapshot.hasData) {
            return Scaffold(
            appBar: AppBar(
              title: const Text("EXPENX"),
            ),
            // body: buildUi(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Column(
                children: [
                  Text(data.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){
                        transaction.put('first',wallet + 28.0);
                      }, icon: const Icon(Icons.add)),
                      IconButton(onPressed: (){
                        transaction.put('first',wallet - 28.0);
                      }, icon: const Icon(Icons.remove)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){
                      transaction.put('first',wallet+ 12.0);
                      // transaction.watch();
                    }, child: const Text("start")),
                  ElevatedButton(onPressed: (){
                      transaction.delete('first',);
                      // transaction.watch();
                    }, child: const Text("delete")),
                  ElevatedButton(onPressed: (){
                      transaction.put('first', 100.01);
                      // transaction.watch();
                    }, child: const Text("update"))
                    ],
                  )
                ],
              ),),
            ),
            
          );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
          
            
            );     
          }

         return buildUi();   
      });
  }
}