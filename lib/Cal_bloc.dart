
import 'package:flutter/material.dart';

class ArithmeticOperation extends ChangeNotifier
{
      int Add(int n1,int n2)
      {
          int result ;
          result = n1+n2;
          return result;
          notifyListeners();
      }


      int Subtract(int n1,int n2)
      {
        int result;
        result = n1-n2;
        return result;
        notifyListeners();
      }
}