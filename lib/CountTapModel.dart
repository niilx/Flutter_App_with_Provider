
import 'package:flutter/material.dart';

class CountTapModel extends ChangeNotifier{
int value = 0;

int getValue() => value;

incrementValue(){
  value++;
  notifyListeners();
}

MultiplyValue(){
  value =value*value;
  notifyListeners();
}

resetValue(){
  value = 0;
  notifyListeners();
}

decrementValue(){
  value--;
  notifyListeners();
}
}