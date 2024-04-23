import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Color.fromARGB(255,202, 240, 248),
        ),
        backgroundColor: Color.fromARGB(255,144, 224, 239),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: 'images/saya.jpeg'),
              TitleSection(name: 'Taufik Rudhanto (STI202102183)', location: 'Ringgit,Ngombol,Purworejo',),
              ButtonSection(),
              TextSection( 
              description: 'Saya adalah seorang mahasiswa semester 6 yang sedang mempelajari bebrapa bahasa pemrograman seperti php.phyton,futter dan banyak lagi, saya sangat tertarik dengan dunia IT karena menurut saya IT adalah sebuah tantangan yang harus di taklukkan supaya kita di masa depan tidak di perbudak oleh pesatnya kemajuan teknologi',
              additionalDescription: 'NIKMATI MASA GAGALMU SEBELUM DATANG MASA EMASMU',),
            ],
          )
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('81'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
    this.additionalDescription, // Tambahkan parameter deskripsi tambahan
  });

  final String description;
 final String? additionalDescription; // Deklarasikan variabel untuk deskripsi tambahan

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(height: 10,), // Beri sedikit jarak antara deskripsi utama dan tambahan
          Text(
            additionalDescription ?? '', // Gunakan deskripsi tambahan, jika ada
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 255, 69, 69),
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}