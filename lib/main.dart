import 'package:expenx/backend_funtions/hive_funtion.dart';
import 'package:expenx/views/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
   Hive.init(path.path);

  //  final documentDir = await getApplicationDocumentsDirectory();
  // final documentDir = await Backend().getPath();
  
  // Backend().initHive(documentDir.toString());

  //  final  box = Hive.box('transaction');
  // // Backend().openBox();
  // await box.put('Income', 200);
  // // await Backend().viewAction('income');
  // Hive.openBox("Records");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EXPENX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitApp(),
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

