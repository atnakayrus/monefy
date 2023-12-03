import 'package:flutter/material.dart';
import 'package:monefy/constants/appstyle.dart';
import 'package:monefy/widgets/balanceCard.dart';
import 'package:monefy/widgets/chatBotDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.accentOff,
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: AppStyle.headingText,
        ),
        backgroundColor: AppStyle.mainColor,
      ),
      body: Stack(children: [
        Container(height: 200, child: BalanceCard(total: 20, spent: 5)),
        SizedBox.expand(
          child: DraggableScrollableSheet(
            snap: true,
            minChildSize: 0.6,
            maxChildSize: 1,
            initialChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                decoration: BoxDecoration(
                    color: AppStyle.bgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            },
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => ChatBotDialog());
        },
        child: Icon(Icons.chat_bubble),
        backgroundColor: Colors.red,
      ),
    );
  }
}
