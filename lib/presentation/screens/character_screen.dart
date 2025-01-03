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
            ): SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                        children: [
                          Card(
                elevation: 10,
                color: Colors.grey.shade700,
                child: Container(

                  padding:  const EdgeInsets.all(8),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(character.results![0].image!,
                      height: 100,
                      width: 100,

                      ),

                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(character.results![0].name!,
                            style: const TextStyle(
                              fontSize: 20,
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
                              Text(character.results![0].status!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),
                              const Text(' - ',
                              style: TextStyle(
                                color: Colors.white
                              ),
                              ),
                              Text(character.results![0].species!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              const Text('Gender : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),),
                              Text(character.results![0].gender!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                          const Text('Created : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),),
                          Text(character.results![0].created!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),)


                        ],
                      ),
                    ],

                  ),


                          ),
                          ),
                          Card(
                elevation: 10,
                color: Colors.grey.shade700,
                child: Container(

                  padding:  const EdgeInsets.all(8),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(character.results![1].image!,
                        height: 100,
                        width: 100,

                      ),

                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(character.results![1].name!,
                            style: const TextStyle(
                                fontSize: 20,
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
                              Text(character.results![1].status!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),
                              const Text(' - ',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              Text(character.results![1].species!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              const Text('Gender : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),),
                              Text(character.results![1].gender!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                          const Text('Created : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),),
                          Text(character.results![1].created!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),)


                        ],
                      ),
                    ],

                  ),


                ),
                          ),
                          Card(
                elevation: 10,
                color: Colors.grey.shade700,
                child: Container(

                  padding:  const EdgeInsets.all(8),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(character.results![2].image!,
                        height: 100,
                        width: 100,

                      ),

                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(character.results![2].name!,
                            style: const TextStyle(
                                fontSize: 20,
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
                              Text(character.results![2].status!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),
                              const Text(' - ',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              Text(character.results![2].species!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              const Text('Gender : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),),
                              Text(character.results![2].gender!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                          const Text('Created : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),),
                          Text(character.results![2].created!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),)


                        ],
                      ),
                    ],

                  ),


                ),
                          ),
                          Card(
                elevation: 10,
                color: Colors.grey.shade700,
                child: Container(

                  padding:  const EdgeInsets.all(8),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(character.results![0].image!,
                        height: 100,
                        width: 100,

                      ),

                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(character.results![3].name!,
                            style: const TextStyle(
                                fontSize: 20,
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
                              Text(character.results![3].status!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),
                              const Text(' - ',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              Text(character.results![3].species!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              const Text('Gender : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),),
                              Text(character.results![3].gender!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                          const Text('Created : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),),
                          Text(character.results![3].created!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),)


                        ],
                      ),
                    ],

                  ),


                ),
                          ),
                          Card(
                elevation: 10,
                color: Colors.grey.shade700,
                child: Container(

                  padding:  const EdgeInsets.all(8),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(character.results![4].image!,
                        height: 100,
                        width: 100,

                      ),

                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(character.results![4].name!,
                            style: const TextStyle(
                                fontSize: 20,
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
                              Text(character.results![4].status!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),
                              const Text(' - ',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              Text(character.results![4].species!,
                                style: const TextStyle(
                                    fontSize: 10,

                                    color: Colors.white
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              const Text('Gender : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),),
                              Text(character.results![4].gender!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                          const Text('Created : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),),
                          Text(character.results![4].created!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),)


                        ],
                      ),
                    ],

                  ),


                ),
                          )

                        ],
                      ),
              ),
            )

    );
  }
}
//     : ListView.builder(
// itemCount: character.results!.length,
// itemBuilder: (context, index) => ListTile(
// leading: Image.network(character.results![index].image!),
// title: Text(character.results![index].name!),
// ),
// ),