import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  _Detail_PageState createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About bank"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: res[2],
              height: 150,
              width: double.infinity,
            ),
            Text(
              "Company:-${res[0]}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "CEO:-${res[1]}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              "establish year:-${res[3]}",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text(
              "Branch: ${res[4]}",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            FloatingActionButton.extended(
              label: Text(" Website..."),
              onPressed: () async {
                String _url = res[6];
                if (await canLaunch(_url)) {
                  await launch(_url);
                }
              },
              icon: const Icon(Icons.language),
            ),
            FloatingActionButton.extended(
              label: Text(" Call to..."),
              onPressed: () async {
                String _url = res[5];
                if (await canLaunch(_url)) {
                  await launch(_url);
                }
              },
              icon: const Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}