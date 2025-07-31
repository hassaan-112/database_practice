import 'package:database_practice/repo.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'model.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DBHelper? dbHelper;
  List<Map<String,dynamic>>? notes;
  Notes notes1 = Notes();
  repo _repo = repo();
  @override
  void initState() {
    dbHelper = DBHelper.getInstance;
    super.initState();
    getnotes();
    getDB();}
  getnotes()async{
    notes1 =await _repo.getAll();
  }
  getDB()async {
    notes = await dbHelper!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(notes1.toMap());
    return Scaffold(

      appBar: AppBar(

        title: Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          notes==null?CircularProgressIndicator():
              Expanded(
                child: ListView.builder(itemCount: notes!.length,itemBuilder: (context,index){
                  return ListTile(
                    leading: Text((index+1).toString(),style: TextStyle(fontSize: 15),),
                    title: Text(notes![index]['title']),
                    subtitle: Text(notes![index]['description']),
                    trailing: IconButton(onPressed: ()async{
                      await dbHelper!.deleteNote(id: notes![index]['id']);
                      getDB();
                    }, icon: Icon(Icons.delete)),
                  );

                },),
              )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // dbHelper?.insertNote(title: "New Note", description: "New Note Description");
        Note n =Note(title: "By model",description: "this note is added using model and repository");
        _repo.addOne(n);
        getDB();

      },child: Icon(Icons.add),)
    );
  }
}
