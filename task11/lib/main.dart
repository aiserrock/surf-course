import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyBusinessCardApp());
}

class MyBusinessCardApp extends StatelessWidget {
  const MyBusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBusinessCardScreen(),
    );
  }
}

class MyBusinessCardScreen extends StatelessWidget {
  const MyBusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(IconRes.photo),
            ),
            const SizedBox(height: 10.0),
            const Text(
              textAlign: TextAlign.center,
              StringRes.name,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            buildInfoCard(
              title: StringRes.aboutTitle,
              content: StringRes.aboutDescritpion,
              icon: IconRes.diving,
            ),
            buildInfoCard(
              title: StringRes.hobbiesTitle,
              content: StringRes.hobbiesDescription,
              icon: IconRes.fun,
            ),
            buildInfoCard(
              title: StringRes.experienceTitle,
              content: StringRes.experienceDescription,
              icon: IconRes.gen,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required String title,
    required String content,
    required String icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: SvgPicture.asset(icon,height: 24),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'SourceSans',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          content,
          style: const TextStyle(
            fontFamily: 'SourceSans',
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

abstract class IconRes {
  static const diving = 'assets/svg/diving.svg',
      fun = 'assets/svg/fun.svg',
      gen = 'assets/svg/gen.svg',
      photo = 'assets/img/photo.png';
}

abstract class StringRes {
  static const name = 'Заикин Владислав Сергеевич',
      aboutTitle = 'О себе',
      aboutDescritpion =
          'Flutter fan. StackOverflow helper. Voracious reader. Avid traveler.',
      hobbiesTitle = 'Увлечения',
      hobbiesDescription =
          'Читать Понасенкова \"Первая научная история войны 1812 года\", смотреть Первый научный на YouTube',
      experienceTitle = 'Опыт в разработке',
      experienceDescription = 'почти 3 годика';
}
