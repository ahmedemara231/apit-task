import 'package:api_task/Api/Api_model.dart';
import 'package:api_task/Api/repository.dart';
import 'package:flutter/material.dart';

class TenByTitle extends StatefulWidget {
  const TenByTitle({Key? key}) : super(key: key);

  @override
  State<TenByTitle> createState() => _TenByTitleState();
}

class _TenByTitleState extends State<TenByTitle> {
  late bool isLoading;
  Repository repository = Repository();
  List<ApiModel> data = [];
  void getData()async
  {
    isLoading = true;
    data = await repository.tenRandomByTitle('naruto');
    if(data.isEmpty)
      {
        print('empty');
      }
    else
      {
        print('not empty');
      }
    setState(() {
      isLoading = false;
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
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: isLoading? const Center(child: Text('Loading...')) : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onChanged: (title)
              {
                setState(() {
                  if(title.isEmpty)
                    {
                      getData();
                    }
                  else
                    {
                      data = data.where((element) => element.character.contains(title)).toList();
                    }
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                  title: Text('${data[index].anime}'),
                  subtitle: Text('${data[index].quote}'),
                  trailing: Text('${data[index].character}'),
              ),
            ),
                separatorBuilder:(context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: data.length
            ),
          ),
        ],
      ),
    );
  }
}
