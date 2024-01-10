import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class Backend {
  
  //get the document path
  getPath()async{
    final path = await getApplicationDocumentsDirectory();
    return path;
  }
    Box? box;
  // final box = Hive.box('transaction');
  //init Hive
  void initHive(String path){
    Hive.init(path);
    //  Hive.openBox(box.name);
    // Hive.openBox('transit');
    // openBox();
    print("$path is here");
  }
  //create a box
  // Box? transaction;
  // final  box = Hive.box('transaction');
  
  // //open box
  // openBox(){
  //   // Hive.openBox('transaction').then((box){
  //   // });
  //   box =  Hive.box('transaction');
  // }
  //function to add to box
  Future<void> addAction(key,value)async{
    // await box.add(value);
    await box!.put(key, value);
  }
  //function to delete from box
  Future<void> removeAction(value)async{
    await box!.delete(value);
  }
  //function to update a box item
  Future<void> updateAction(key)async{
    await box!.get(key);
  }
  //function to view box
  viewAction(key)async{
   final views = await box!.get(key);
   print(views);
   return views;
  }

}