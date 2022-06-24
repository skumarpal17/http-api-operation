import 'Package:flutter/material.dart';
import 'package:httpoperations/services.dart';
import 'modelClass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Services _services = Services();
  late ModelClass _dataModell;
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud-Operation'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: FutureBuilder<ModelClass>(
                  future: _services.fetchAlbum(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.title.toString());
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(context: context,
              builder:(ctx){
            return AlertDialog(
              title: Text('Enter Your Value '),
              content: Container(

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: text1,
                          decoration: InputDecoration(
                            labelText: 'Text Field 1',
                            hintText: 'Text Field 1',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        // margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: text2,
                          decoration: InputDecoration(
                            labelText: 'Text Field 2',
                            hintText: 'Text Field 2',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () async {
                            String name = text1.text;
                            String job = text2.text;
                            ModelClass data = await _services.postData(name, job);

                            setState(() {
                              _dataModell = data;
                            });
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}