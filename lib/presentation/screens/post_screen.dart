import 'package:flutter/material.dart';
import 'package:public_api/data/database/post_db.dart';
import 'package:public_api/data/models/post.dart';
import 'package:public_api/presentation/widget/add_post.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> result = [];
  bool isLoading = true;
  PostDb postDb = PostDb();
  @override
  void initState() {
    //* Initial State
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
    result = await postDb.postData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text('Posts',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
        actions: [
          IconButton(onPressed: () {
            showModalBottomSheet
              (
                context: context,
                builder: (context) => const AddPost(),

            );
          },
              icon: const Icon(Icons.add,color: Colors.white,),)
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text("${result[index].id}"),
                title: Text(result[index].title!),
                subtitle: Text(result[index].body!),
              ),
            ),
    );
  }
}
