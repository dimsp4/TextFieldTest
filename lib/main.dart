import 'package:flutter/material.dart';

void main() {
  runApp(InputTeks());
}

class InputTeks extends StatefulWidget {
  @override
  State<InputTeks> createState() => _InputTeksState();
}

class _InputTeksState extends State<InputTeks> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 3, vsync: this);
    this.tabController.addListener(() {
      print('tab berubah');
      this.hasil = 0;
      setState(() {});
    });
  }

  int hasil = 0;
  List<Tab> myList = [
    Tab(
      text: "Pangkat 2",
    ),
    Tab(
      text: "Pangkat 3",
    ),
    Tab(
      text: "Pangkat 4",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pangkat"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(50, 50),
            child: TabBar(
              controller: this.tabController,
              tabs: myList,
            ),
          ),
        ),
        body: TabBarView(
          controller: this.tabController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        int kali = int.parse(value);
                        hasil = kali ^ 2;
                      });
                    },
                  ),
                ),
                Text("Hasil : $hasil")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        int kali = int.parse(value);
                        hasil = kali ^ 3;
                      });
                    },
                  ),
                ),
                Text("Hasil : $hasil")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        int kali = int.parse(value);
                        hasil = kali ^ 4;
                      });
                    },
                  ),
                ),
                Text("Hasil : $hasil")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
