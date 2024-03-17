import 'package:flutter/material.dart';
import 'package:notesapp/models/note_database.dart';
import 'package:notesapp/screens/note_page.dart';
import 'package:notesapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        // Note Provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),
        // Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NotesPage(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
