import 'package:flutter/material.dart';

void main() {
  runApp(const ProgrammingLanguagesApp());
}

List<Map<String, String>> enrolledCourses = [];

class ProgrammingLanguagesApp extends StatelessWidget {
  const ProgrammingLanguagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.green[50], // Легкий зеленый фон для всего приложения
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
      'price': '4999 руб',
    },
    {
      'name': 'JavaScript',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
      'description': 'JavaScript — это язык программирования для веб-разработки.',
      'price': '6000 руб.',
    },
    {
      'name': 'Java',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Bufo_bufo_03-clean.jpg/1024px-Bufo_bufo_03-clean.jpg',
      'description': 'Java — популярный объектно-ориентированный язык программирования.',
      'price': '7000 руб',
    },
    {
      'name': 'C++',
      'image': 'https://itmentor.by/images/articles/5-besplatnyh-materialov-po-izucheniyu-c-plus-plus.jpg',
      'description': 'C++  — компилируемый, статически типизированный язык программирования общего назначения. Поддерживает такие парадигмы программирования, как процедурное программирование, объектно-ориентированное программирование, обобщённое программирование.',
      'price': '6500 руб',
    },
    {
      'name': 'Dart',
      'image': 'https://habrastorage.org/getpro/habr/post_images/4cb/16c/04a/4cb16c04af8fc5b2f5e1aac1cc67ecd8.png',
      'description': 'Dart считается языком общего назначения, но его создатели ориентировали его в первую очередь на фронтенд: создание интерфейсов и взаимодействие с браузером.',
      'price': '5500 руб',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Курсы по языкам программирования',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[700],
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EnrolledCoursesPage()),
              );
            },
          ),
        ],
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        languages[index]['image']!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
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
        backgroundColor: Colors.green[50], // Легкий зеленый фон
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
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  enrolledCourses.add(language);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Вы записались на курс ${language['name']}')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Записаться на курс'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnrolledCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мои курсы', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green[50], // Легкий зеленый фон
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: enrolledCourses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        enrolledCourses[index]['name']!,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Цена: ${enrolledCourses[index]['price']}',
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      enrolledCourses.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Курс удалён')),
                      );
                      (context as Element).reassemble();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
