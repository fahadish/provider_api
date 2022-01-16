import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/controller/appState/app_state.dart';
import 'package:provider_api/controller/data_controller.dart';
import 'package:provider_api/model/data_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Consumer<AppState>(builder: (context, provider, child){
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.refresh),onPressed: ()async{
         List<DataModel>data = await DataController().getData();
         provider.updateDataModel(data);
        },
        ),
        appBar: const CupertinoNavigationBar(
          middle: Text('code with fahad RestApi'),
        ),
        body: Container(
          height: size.height -
          const CupertinoNavigationBar().preferredSize.height,
          width: size.width,

          child: provider.dataList.isEmpty?Text('there is nothing'):ListView.builder(itemBuilder: (context ,index){
            return ListTile(
title: Text('${provider.dataList[index].title}'),
              leading: Text('${provider.dataList[index].id}'),
            );
          },itemCount: provider.dataList.length,
          ),
        ),
      );
    },

    );
  }
}
