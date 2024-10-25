import 'package:flutter/material.dart';

class FoldersPage extends StatefulWidget{
  final String folderName;
  const FoldersPage({required this.folderName, super.key});

  @override
  State<FoldersPage> createState() => _FoldersPage();
}

class _FoldersPage extends State<FoldersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey.shade100,
    body: Column(children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          alignment: Alignment.bottomCenter,
          height: 170,
          decoration: BoxDecoration (color: Colors.grey.shade200,),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "FolderName",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(  "FolderDescription",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(.05)
                  ),
                  child: IconButton(icon: const Icon(Icons.share_outlined, size: 28, color: Colors.blue,), 
                  onPressed: () {},
                  ),
                ),
            ],
            ),
          ]),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                  "Files",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
                Text(
                  "Add new",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ], 
              ),
            ],
          ),
        ),
          ],
        ),
      );
  }
}