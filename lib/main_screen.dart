import 'package:dbhelperprovider/dbhelperprovider.dart';
import 'package:dbhelperprovider/update_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_note_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<DbHelperProvider>(
          builder: (context,value,child){
            return ListView.builder(itemBuilder: (context,index){
              return Column(
                children: [
                  Text(value.list[index].msg),
                  Row(
                    children: [
                      IconButton(onPressed: () async {
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                 UpdateNoteScreen(note: value.list[index])),
                        );


                      },
                          icon: Icon(Icons.edit)),
                      IconButton(
                         onPressed: () async {
                         value.deleteNote(id: value.list[index].id,index: index);
                          }, icon: Icon(Icons.delete)),
                    ],
                  ),
                ],
              );

            });

      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context) => AddNoteScreen(),
          ),
        );
      },
      child: Icon(Icons.add),),
    );
  }
}
