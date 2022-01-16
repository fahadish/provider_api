import 'package:flutter/cupertino.dart';
import 'package:provider_api/model/data_model.dart';

class AppState extends ChangeNotifier{

  List<DataModel> dataList =[];

  void updateDataModel(List<DataModel>dataList){
this.dataList = dataList;
notifyListeners();
  }
}