import 'package:flutter/foundation.dart';
import 'package:local_db/database_helper.dart';
import 'package:local_db/note.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];
  late DatabaseHelper _dbHelper;

  List<Note> get notes => _notes;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  void _getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }


  // Add Note to Database
  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
    _getAllNotes();
  }

  // Get Note By ID
  Future<Note> getNoteById(int id) async {
    return await _dbHelper.getNoteById(id);
  }

  // Update Note to Database
  void updateNote(Note note) async {
    await _dbHelper.updateNote(note);
    _getAllNotes();
  }

  // Delete Note to Database
  void deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    _getAllNotes();
  }
}
