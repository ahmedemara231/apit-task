import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/repository.dart';
import 'package:flutter/material.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late bool isLoading;
  Repository repository = Repository();
  List<ApiModel> data = [];
  void getData()async
  {
    try
    {
      isLoading = true;
      data = await repository.getTenRandom();
      setState(() {
        isLoading = false;
      });
    }catch(error)
    {
      print('errorrrrrrrrrrr : $error');
    }
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
      appBar: AppBar(
        title: const Text('api test'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onChanged: (character)
              {
                setState(() {
                  if(character.isEmpty)
                  {
                    return getData();
                  }
                  else
                  {
                    data = data.where((element) => element.character.contains(character)).toList();
                  }
                });
              },
              decoration:const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text('${data[index].anime}'),
                    subtitle: Text('${data[index].quote}'),
                    trailing:  Text('${data[index].character}'),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 15,),
                itemCount: data.length
            ),
          ),
        ],
      ),
    );
  }
}
