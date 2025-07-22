import 'package:flutter/widgets.dart';

class ListProvider extends ChangeNotifier {
  List<bool> selected = List.generate(10, (index) => false,);

  void listGenerate(int index){
    selected[index] =! selected[index];
    notifyListeners();
  }
}