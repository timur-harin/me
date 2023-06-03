import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timur Harin',
        home: const SimpleWebPage(),
        theme: ThemeData(
          fontFamily: 'JetBrainsMono',
          primarySwatch: Colors.green,
        ));
  }
}

class SimpleWebPage extends StatefulWidget {
  const SimpleWebPage({super.key});

  @override
  State<SimpleWebPage> createState() => _SimpleWebPageState();
}

class _SimpleWebPageState extends State<SimpleWebPage> {

// TODO add
  List<IconLaunch> topIcons = [
    IconLaunch(url: "https://t.me/timur_harin", icon: Icons.telegram),
    IconLaunch(url: "https://github.com/timur-harin", icon: Icons.home),
    IconLaunch(url: "https://leetcode.com/timur_harin/", icon: Icons.code),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 12,
                backgroundImage: AssetImage("assets/images/me.jpeg"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var icon in topIcons)
                    IconButton(
                      onPressed: () async => {
                        if (!await launchUrl(Uri.parse(icon.url)))
                          {throw Exception('Could not launch ${icon.url}}')}
                      },
                      icon: Icon(icon.icon),
                      iconSize: MediaQuery.of(context).size.width / 20,
                      color: Colors.white,
                    )
                ],
              )
            ],
          ))),
    );
  }
}

class IconLaunch {
  const IconLaunch({required this.url, required this.icon});

  final String url;
  final IconData icon;
}
