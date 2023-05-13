import 'package:flutter/cupertino.dart';
class UserInformation extends ChangeNotifier{
 late final String emailAddress;
 void setEmail(String emil){
   emailAddress=emil;
 }
 String geEmail(){
   return emailAddress;
 }
}
