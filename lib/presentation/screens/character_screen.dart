import 'package:flutter/material.dart';
import 'package:public_api/core/services/api_service.dart';
import 'package:public_api/core/utils/constants/urls.dart';
import 'package:public_api/data/models/character.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool isLoading = true;
  final ApiService _apiService = ApiService();
  late Character character;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCharacters();
  }

  void _loadCharacters() async {
    final data = await _apiService.fetchData(characterUrl);
    character = Character.fromJson(data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text('Characters',
        style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            ): ListView.builder(
          itemCount:character.results!.length,
          itemBuilder: (context, index) {
            final object = character.results![index];
            return  Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                elevation: 10,
                color: Colors.grey.shade700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network('${object.image}',
                        height: 120,
                        width: 120,
                      ),
                      const SizedBox(width: 20),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${object.name}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 5),
                              Text("${object.status} - ",
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                              ),
                              Text(character.results![index].species!,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          Text('Gender :${object.gender} ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const Text('Created:',style: TextStyle(color: Colors.white,fontSize: 12),),
                          Text('${object.created}',style: const TextStyle(color: Colors.white,fontSize: 12),),
                          const Text('First seen in:',style: TextStyle(color: Colors.white,fontSize: 12),),
                          Text('${object.origin?.name}',style: const TextStyle(fontSize: 12,color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}
