import 'package:dbhelperprovider/dbhelperprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note.dart';


class UpdateNoteScreen extends StatelessWidget {
  TextEditingController textEditingController=TextEditingController();
  Note note;

  UpdateNoteScreen({required this.note}){
    textEditingController.text=note.msg;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: TextField(
          controller: textEditingController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),
      bottomNavigationBar: TextButton(
          onPressed: () async {
            Provider.of<DbHelperProvider>(context,listen: false).updateNote
              (id:note.id,msg: textEditingController.text);
            Navigator.pop(context);
          },
          child: Text("Save")),
    );
  }
}
