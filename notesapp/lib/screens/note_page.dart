import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/components/drawer.dart';
import 'package:notesapp/components/note_tile.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNote();
  }

// create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Create Note"),
        content: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: textController,
        ),
        actions: [
          //  create button
          MaterialButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                context
                    .read<NoteDatabase>()
                    .addNote(textController.text.trim());
              }
              ;

              // controller clear
              textController.clear();
              // pop dialog box
              Navigator.pop(context);
            },
            child: Text("Create"),
          ),
        ],
      ),
    );
  }

// read a note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update note
  void updateNote(Note note) {
    // prefill the existing note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Update Note"),
        content: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: textController,
        ),
        actions: [
          // update button
          MaterialButton(
            onPressed: () {
              context
                  .read<NoteDatabase>()
                  .updateNotes(note.id, textController.text.trim());
              // controller clear
              textController.clear();
              // pop dialog box
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }

  // delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();
    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: createNote,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADING
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // LIST OF NOTES
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                // get individual note

                final note = currentNotes[index];
                // List Tile ui
                return GestureDetector(
                  onTap: () => updateNote(note),
                  child: NoteTile(
                    text: note.text,
                    onDeletePressed: () => deleteNote(note.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
