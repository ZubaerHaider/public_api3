import 'dart:io';

import 'package:flutter/material.dart';
import 'package:public_api/core/services/api_service.dart';
import 'package:public_api/presentation/screens/post_screen.dart';

import '../../core/utils/constants/urls.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final ApiService _apiService = ApiService();

  final TextEditingController _titleController= TextEditingController();
  final TextEditingController _bodyController= TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _isValidate() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields must be filled!'),
        ),
      );
      return false;
    }
    if (_bodyController.text.length < 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Description must be at least 20 characters long!'),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
      TextFormField(
      style: const TextStyle(
      color: Colors.black,
      ),
      controller: _titleController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Title',
        hintStyle: const TextStyle(
            color: Colors.black

        ),
      ),
      validator: (value) {
        if(value!.isEmpty){
          return 'Enter your name';
        }
        return null;
      },
    ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 340,
            height: 120,
            child: TextFormField(
              controller: _bodyController,
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
              decoration:  InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  hintText: 'Post Description'
              ),
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async {
              if (await _isValidate()) {
                Map<String, dynamic> body = {
                  "title": _titleController.text,
                  "body": _bodyController.text,
                  "userId": "1"
                };
                  final data = await _apiService.sendData(postUrl, body);
                  if (data != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Submission Successful!'),
                      ),
                    );

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Submission Failed!.'),
                      ),
                    );
                  }

              }
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),




        ],
      ),

    );
  }
}
