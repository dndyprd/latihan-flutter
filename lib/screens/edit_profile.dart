import 'package:flutter/material.dart';
import 'package:latihan_flutter/models/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _profesi64Controller;
  late TextEditingController _domisili64Controller;
  late TextEditingController _nomorTelpon64Controller;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _profesi64Controller = TextEditingController(
      text: widget.profile.profesi64,
    );
    _domisili64Controller = TextEditingController(
      text: widget.profile.domisili64,
    );
    _nomorTelpon64Controller = TextEditingController(
      text: widget.profile.nomorTelpon64,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _profesi64Controller.dispose();
    _domisili64Controller.dispose();
    _nomorTelpon64Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _profesi64Controller,
                decoration: InputDecoration(labelText: 'Profesi'),
              ),
              TextFormField(
                controller: _domisili64Controller,
                decoration: InputDecoration(labelText: 'Domisili'),
              ),
              TextFormField(
                controller: _nomorTelpon64Controller,
                decoration: InputDecoration(labelText: 'No Telp'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = Profile(
                      id: widget.profile.id,
                      name: widget.profile.name,
                      profesi64: widget.profile.profesi64,
                      nomorTelpon64: widget.profile.nomorTelpon64,
                      domisili64: widget.profile.domisili64,
                    );

                    Navigator.pop(context, updatedProfile);
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
