import 'package:flutter/material.dart';
import 'package:file_manager/pages/folder.dart';

class FirstMainPage extends StatefulWidget {
  const FirstMainPage({Key? key}) : super(key: key);

  @override
  State<FirstMainPage> createState() => _FirstMainPage();
}


class _FirstMainPage extends State<FirstMainPage>{
  double availableScreenWidth = 0;
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        //Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          alignment: Alignment.bottomCenter,
          height: 170,
          decoration: const BoxDecoration (color: Color.fromARGB(206, 69, 114, 239),),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "File Manager",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(  "Welcome back!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
                    color: Colors.black.withOpacity(.1)
                  ),
                  child: IconButton(icon: const Icon(Icons.search_outlined, size: 28, color: Colors.white,), 
                  onPressed: () {},
                  ),
                ),
            ],
            ),
          ]),
        ),
        const SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(text: const TextSpan(
                text: "Storage ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ),
              RichText(text: const TextSpan(
                text: "9.8/10Gb ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const Text(
              "Upgrade",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(children: [
            buildChartSize("VIDEOS", Colors.red, .38),
            const SizedBox( width: 2,),
            buildChartSize("DOCS", Colors.yellow, .25),
            const SizedBox( width: 2,),
            buildChartSize("PICTURES", Colors.blue, .3),
            const SizedBox( width: 2,),
            buildChartSize("", Colors.grey, .052),
          ],),
        ),
        const SizedBox(height: 15,),
        const Divider(height: 20,),
        Expanded(
          child: ListView(
            padding:  const EdgeInsets.all(25),
            children: [
              const Text(
                "Recent",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  buildMap(),
                ],
              ),
              const Divider(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Folders",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    IconButton(icon: const Icon(Icons.share_outlined, size: 18, color: Colors.blue,), 
                    onPressed: () {},
                    ),
                      ],
                  ),
              const SizedBox(height: 15,),
              buildFolders("Docs"),
              buildFolders("Pictures"),
              buildFolders("Videos"),
              buildFolders("Music"),
            ],
          ),
        )
      ],),

floatingActionButton: Container(
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1,)
    ]
  ),
  child:   FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Time', 
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Folder',)
      ]), 
    );
  }

  Widget buildFolders(String folderName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) => FoldersPage(folderName: folderName,),)
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Colors.blue[200],
                        ),
                      const SizedBox(width: 12,),
                      Text(
                        folderName,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded,
                    color: Colors.grey,),
                    ),
                  ],
                ),
              ),
    );
  }

  Column buildMap() {
    return Column(
                  children: [
                    SizedBox(width: availableScreenWidth,),
                    Container(
                      width: availableScreenWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                        ),
                      height: 180,
                      child: Image.asset('assets/images/qr.png'),
                    ),
                    const SizedBox(height: 15,),
                    RichText(text: const TextSpan(
                      text: 'IMG_3738192',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      ),
                    ),
                  RichText(text: const TextSpan(
                    text: '14,8 Mb',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  ),    
                  ],
                );
  }

  Column buildChartSize(String title, Color color, double widthPersentage) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: availableScreenWidth * widthPersentage,
                height: 4,
                color: color,
              ),
            const SizedBox(height: 15,),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            ],
          );
  }
} 