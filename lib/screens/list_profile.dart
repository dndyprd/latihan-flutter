import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latihan_flutter/models/profile.dart';
import 'package:latihan_flutter/screens/detail_profile.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int lastIndex = profiles.length;
      profiles.add(
        Profile(
          id: lastIndex + 1,
          name: "Dandy ${lastIndex + 1}",
          profesi64: "Front-end Developer",
          nomorTelpon64: "081234567890",
          domisili64: "Bali, Indonesia",
        ),
      );
    });
  }

  void deleteItem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Profile')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteItem(index);
              Fluttertoast.showToast(
                msg: "Profile ${deletedItem.name} dihapus",
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://ui-avatars.com/api/?name=${profile.name}&background=1172c2&color=fff&size=100',
                ),
              ),
              title: Text(profile.name),
              subtitle: Text('${profile.profesi64} | ${profile.domisili64}'),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProfile(profile: profile),
                  ),
                );
                setState(() {});
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
