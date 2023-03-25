import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/repository.dart';
import 'package:flutter/material.dart';

class RandomByChar extends StatefulWidget {
  const RandomByChar({Key? key}) : super(key: key);

  @override
  State<RandomByChar> createState() => _RandomByCharState();
}

class _RandomByCharState extends State<RandomByChar> {
  Repository repository = Repository();
  List<ApiModel> data = [];
  void getData()async
  {
   data = await repository.tenRandomByChar('saitama');
   if(data.isEmpty)
     {
       print('empty');
     }
   else{
     print('not empty');
   }
   setState(() {

   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) => Row(
            children: [
              Text('${data[index].id}'),
              Card(
                child: ListTile(
                  title: Text('${data[index].anime}'),
                  subtitle: Text('${data[index].quote}'),
                  trailing: Text('${data[index].character}'),
                ),
              ),
            ],
          ),
          separatorBuilder:(context, index) =>  SizedBox(
            height: 15,
          ),
          itemCount: data.length
      ),
    );
  }
}
