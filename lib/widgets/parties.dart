import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartiesWidget extends StatefulWidget {
  const PartiesWidget({Key? key}) : super(key: key);

  @override
  State<PartiesWidget> createState() => _PartiesState();
}

class _PartiesState extends State<PartiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: ListView(
        children: [
          Column(
            children: [
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.circle_outlined, size: 50),
                    title: const Text('Partie 1'),
                    subtitle: const Text('Votre partie en cours'),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
