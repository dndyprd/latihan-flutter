import 'package:flutter/material.dart';

class DetailProfile extends StatefulWidget {
  final String? passedData;

  const DetailProfile({super.key, this.passedData});

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
                        'https://dndyprd.vercel.app/img/profile.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.passedData != null && widget.passedData!.isNotEmpty) ...[
              SizedBox(height: 8),
              Text(
                'Nama : ${widget.passedData}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
            Text(
              'NIM : 2415354064',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              'Kelas : 4D TRPL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  Text(
                    'I\'m a programmer with a passion for front-end development and a graphic designer. My interest in technology and graphic design stems from my curiosity. My love of art and aesthetics drives me to create solutions that are not only effective but also visually appealing, combining functionality with compelling design. Here, I combine technical skills and creativity to develop impactful digital experiences that deliver real value to users.',
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
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
