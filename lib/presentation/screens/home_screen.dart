import 'package:flutter/material.dart';
import 'package:public_api/presentation/screens/character_screen.dart';
import 'package:public_api/presentation/screens/post_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Get API'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PostScreen()),
                );
              },
              child: const Text('    Get Posts     ',
              style: TextStyle(
                color: Colors.black
              ),),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CharacterScreen()),
                );
              },
              child: const Text('Get Characters',
                style: TextStyle(
                    color: Colors.black
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
