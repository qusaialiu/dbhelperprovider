import 'package:dbhelperprovider/dbhelperprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController textEditingController=TextEditingController();

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
          Provider.of<DbHelperProvider>(
              context,listen: false).inserNote(msg: textEditingController.text);
            Navigator.pop(context);
          },
          child: Text("Save")),
    );
  }
}
