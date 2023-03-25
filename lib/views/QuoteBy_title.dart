import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/repository.dart';
import 'package:flutter/material.dart';


class QuoteTitle extends StatefulWidget {
  const QuoteTitle({Key? key}) : super(key: key);

  @override
  State<QuoteTitle> createState() => _QuoteTitleState();
}

class _QuoteTitleState extends State<QuoteTitle> {
  ApiModel? data;
  Repository repository = Repository();
  void byTitle()async
  {
    data = await repository.getByTitle(title: 'naruto');
   print(data?.character);
   setState(() {

   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    byTitle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('${data?.anime}'),
              subtitle: Text('${data?.quote}'),
              trailing: Text('${data?.character}'),
            ),
          ),
        ],
      ),
    );
  }
}
