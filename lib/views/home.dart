import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final transaction =  Hive.openBox('transaction');
   TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:  Hive.openBox('transaction'),
      builder: (context, snapshot){
         
          // final transaction = snapshot.data;
          
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){
                        transaction.put('first',wallet +double.parse(_controller.text));
                      }, icon: const Icon(Icons.add)),
                      IconButton(onPressed: (){
                        transaction.put('first',wallet - double.parse(_controller.text));
                      }, icon: const Icon(Icons.remove)),
                    ],
                  ),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){
                      transaction.put('first',wallet );
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