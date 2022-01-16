import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:provider_api/model/data_model.dart';
class DataController{

  Future<List<DataModel>> getData()async{
    List<DataModel> listData =[];
    try{
      var request = http.Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
     var rawData = await response.stream.bytesToString();
     List<dynamic> data =jsonDecode(rawData);
     data.forEach((element) {
  DataModel model = DataModel.fromJson(element);
       listData.add(model);
     });
     return listData;
      }
      else {
        print(response.reasonPhrase);
        return [];
      }

    }catch(e){
      print('exception in data $e');
      throw e;
    }
  }
}