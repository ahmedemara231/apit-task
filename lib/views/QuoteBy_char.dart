import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/repository.dart';
import 'package:flutter/material.dart';

class QuoteChar extends StatefulWidget {
  const QuoteChar({Key? key}) : super(key: key);

  @override
  State<QuoteChar> createState() => _QuoteCharState();
}

class _QuoteCharState extends State<QuoteChar> {
  Repository repository = Repository();
  ApiModel? apiModel;
  ApiModel? data;
  void getByChar()async
  {
    data = await repository.byChar(character: 'naruto');
   print(data?.character);
   setState(() {

   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getByChar();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Quote by char'),centerTitle: true,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                hintText: 'Search an anime'
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('${data?.character}'),
            ),
          ),
        ],
      ),
    );
  }
}
