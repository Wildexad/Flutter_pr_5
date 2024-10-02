import 'package:flutter/material.dart';

void main() {
  runApp(ProgrammingLanguagesApp());
}

class ProgrammingLanguagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Курсы по языкам программирования',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.grey[200],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: LanguagesPage(),
    );
  }
}

class LanguagesPage extends StatelessWidget {
  final List<Map<String, String>> languages = [
    {
      'name': 'Python',
      'image': 'https://i0.wp.com/junilearning.com/wp-content/uploads/2020/06/python-programming-language.webp?fit=1920%2C1920&ssl=1',
      'description': 'Python — мультипарадигмальный высокоуровневый язык программирования общего назначения с динамической строгой типизацией и автоматическим управлением памятью, ориентированный на повышение производительности разработчика, читаемости кода и его качества, а также на обеспечение переносимости написанных на нём программ',
      'price': '4999 руб.',
    },
    {
      'name': 'JavaScript',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
      'description': 'JavaScript — это язык программирования для веб-разработки.',
      'price': '6000 руб.',
    },
    {
      'name': 'Java',
      'image': 'data:image/jpeg;base64,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',
      'description': 'Java — популярный объектно-ориентированный язык программирования.',
      'price': '7000 руб.',
    },
    {
      'name': 'C++',
      'image': 'https://itmentor.by/images/articles/5-besplatnyh-materialov-po-izucheniyu-c-plus-plus.jpg',
      'description': 'C++  — компилируемый, статически типизированный язык программирования общего назначения. Поддерживает такие парадигмы программирования, как процедурное программирование, объектно-ориентированное программирование, обобщённое программирование. Язык имеет богатую стандартную библиотеку, которая включает в себя распространённые контейнеры и алгоритмы, ввод-вывод, регулярные выражения, поддержку многопоточности и другие возможности. C++ сочетает свойства как высокоуровневых, так и низкоуровневых языков. В сравнении с его предшественником — языком C — наибольшее внимание уделено поддержке объектно-ориентированного и обобщённого программирования',
      'price': '6500 руб.',
    },
    {
      'name': 'Dart',
      'image': 'https://habrastorage.org/getpro/habr/post_images/4cb/16c/04a/4cb16c04af8fc5b2f5e1aac1cc67ecd8.png',
      'description': 'Dart считается языком общего назначения, но его создатели ориентировали его в первую очередь на фронтенд: создание интерфейсов и взаимодействие с браузером. А собственная платформа Dart VM призвана заменить Node.js — инструмент, с помощью которого пишут код на JavaScript для серверной части. Это высокоуровневый язык: он оперирует абстрактными понятиями, далекими от «железа», но близкими к человеку. Поэтому код на Dart лаконичный и понятный, а синтаксис легко освоить. Особенно удобным Dart считается для людей, которые до этого уже изучали другие языки программирования.',
      'price': '5500 руб.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Programming Languages',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LanguageDetailPage(language: languages[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      languages[index]['image']!,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Text(
                      languages[index]['name']!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LanguageDetailPage extends StatelessWidget {
  final Map<String, String> language;

  LanguageDetailPage({required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language['name']!,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              language['image']!,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              language['name']!,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              language['description']!,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              'Цена на обучение: ${language['price']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
