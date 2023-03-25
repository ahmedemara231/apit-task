import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/repository.dart';
import 'package:flutter/material.dart';


class RandomQuote extends StatefulWidget {
   RandomQuote({Key? key}) : super(key: key);

  @override
  State<RandomQuote> createState() => _RandomQuoteState();
}

class _RandomQuoteState extends State<RandomQuote> {
  Repository repository = Repository();
   ApiModel? quote;
  void randomQuote()async
  {
    try
    {
      quote = await repository.getRandomQuote();
      setState(() {

      });
    }catch(e)
    {
      print('errorrrrrr : $e');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomQuote();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote'),
        centerTitle: true,
      ),
      body: Card(
        child: ListTile(
          title: Text('${quote?.anime}'),
          subtitle: Text('${quote?.quote}'),
          trailing: Text('${quote?.character}'),
        ),
      ),
    );
  }
}
