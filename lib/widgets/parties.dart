import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sg_mobile/services/parties_service.dart';

import '../services/service_locator.dart';

class PartiesWidget extends StatefulWidget {
  PartiesWidget({Key? key}) : super(key: key);

  @override
  State<PartiesWidget> createState() => _PartiesState();


}

class _PartiesState extends State<PartiesWidget> {

  final partieService = getIt<PartieService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: ListView(
        children: [
          Column(
            children: [
              FutureBuilder<List<Partie>>(
                future: partieService.getParties(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var partie in snapshot.data!)
                          Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.circle_outlined, size: 50),
                                title: Text(partie.id),
                                subtitle: Text('Votre partie en cours'),
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
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
