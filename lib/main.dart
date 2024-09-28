import 'all_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter News Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardColor: Colors.white,
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 22,
              color: Colors.blue[900],
              fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 20, color: Colors.blue[800]),
          displaySmall: TextStyle(fontSize: 18, color: Colors.blue[700]),
          headlineLarge: TextStyle(
              fontSize: 24,
              color: Colors.blue[900],
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 22, color: Colors.blue[800]),
          headlineSmall: TextStyle(fontSize: 20, color: Colors.blue[700]),
          titleLarge: TextStyle(fontSize: 18, color: Colors.blue[600]),
          titleMedium: TextStyle(fontSize: 16, color: Colors.blue[500]),
          titleSmall: TextStyle(fontSize: 14, color: Colors.blue[400]),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.blue[600]),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.blue[500]),
          bodySmall: TextStyle(fontSize: 12, color: Colors.blue[400]),
          labelLarge: TextStyle(fontSize: 16, color: Colors.blue[600]),
          labelMedium: TextStyle(fontSize: 14, color: Colors.blue[500]),
          labelSmall: TextStyle(fontSize: 12, color: Colors.blue[400]),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
