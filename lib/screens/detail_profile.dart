import 'package:flutter/material.dart';
import 'package:latihan_flutter/models/profile.dart';
import 'package:latihan_flutter/screens/edit_profile.dart';
import 'package:latihan_flutter/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  Color _appBarColor = Colors.blue;

  void _toggleColor() {
    setState(() {
      _appBarColor = (_appBarColor == Colors.blue) ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProfileProvider>();

    final profile = provider.profiles.firstWhere(
      (p) => p.id == widget.profile.id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Profile'),
        backgroundColor: _appBarColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=${widget.profile.name}&background=${_appBarColor.toARGB32().toRadixString(16).padLeft(8, '0').substring(2)}&color=fff&size=250',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<Profile>(
              builder: (context, profile, child) {
                final profile = provider.profiles.firstWhere(
                  (p) => p.id == widget.profile.id,
                );
                return Column(
                  children: [
                    Text(
                      profile.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      profile.profesi64,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      profile.nomorTelpon64,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      profile.domisili64,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Text(
                            'Halo! Perkenalkan, nama saya ${profile.name}. Saya adalah seorang ${profile.profesi64} yang penuh semangat dan saat ini saya menetap / berdomisili di ${profile.domisili64}. Jika Anda memiliki proyek atau kolaborasi, silakan hubungi saya di ${profile.nomorTelpon64}. Mari menciptakan hal-hal hebat bersama!',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _toggleColor,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _appBarColor,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Change Color'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: _appBarColor,
                    textStyle: TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Go Back'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    final Profile? updatedProfile = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditProfile(profile: widget.profile),
                      ),
                    );

                    if (updatedProfile != null) {
                      final provider = context.read<ProfileProvider>();
                      final index = provider.profiles.indexWhere(
                        (p) => p.id == updatedProfile.id,
                      );
                      if (index != -1) {
                        provider.updateProfile(index, updatedProfile);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: _appBarColor,
                    textStyle: TextStyle(fontSize: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
