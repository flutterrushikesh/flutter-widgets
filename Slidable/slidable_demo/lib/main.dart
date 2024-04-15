import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MySlidable(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySlidable extends StatefulWidget {
  const MySlidable({super.key});
  @override
  State createState() => _MySlidableState();
}

class _MySlidableState extends State {
  List<Map<String, String>> cards = [
    {
      "title": "Lorem Ipsum is simply setting industry.",
      "description":
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "date": "10 July 2023",
    },
    {
      "title": "Lorem Ipsum is simply setting industry.",
      "description":
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "date": "10 July 2023",
    },
    {
      "title": "Lorem Ipsum is simply setting industry.",
      "description":
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "date": "10 July 2023",
    },
    {
      "title": "Lorem Ipsum is simply setting industry.",
      "description":
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "date": "10 July 2023",
    },
  ];

  List<Color> colorList = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1)
  ];

  bool toggleIcon = false;

  Icon isToggleIcon() {
    if (toggleIcon == true) {
      return const Icon(Icons.favorite_sharp, color: Colors.pink);
    } else {
      return const Icon(Icons.favorite_border_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slidable"),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  extentRatio: 0.2,
                  motion: const BehindMotion(),
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                              toggleIcon = !toggleIcon;
                            },
                            child: isToggleIcon(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorList[index % colorList.length],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        offset: Offset(4, 8),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.image_outlined),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "${cards[index]["title"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${cards[index]["description"]}",
                                  style: const TextStyle(fontSize: 12),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            "${cards[index]["date"]}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
