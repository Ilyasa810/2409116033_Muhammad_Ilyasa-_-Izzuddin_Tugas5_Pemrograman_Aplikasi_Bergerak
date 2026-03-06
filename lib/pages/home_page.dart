import 'package:flutter/material.dart';
import 'package:ilyasa_033_tugas5/models/event_registrant.dart';
import 'package:ilyasa_033_tugas5/pages/registrant_list_page.dart';
import 'package:ilyasa_033_tugas5/pages/registration_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int? _editIndex;
  EventRegistrant? _editingRegistrant;

  void _startEdit(int index, EventRegistrant registrant) {
    setState(() {
      _editIndex = index;
      _editingRegistrant = registrant;
      _currentIndex = 0;
    });
  }

  void _clearEditing() {
    setState(() {
      _editIndex = null;
      _editingRegistrant = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Event'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          RegistrationFormPage(
            editIndex: _editIndex,
            editingRegistrant: _editingRegistrant,
            onSaved: _clearEditing,
          ),
          RegistrantListPage(onEdit: _startEdit),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Form',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pendaftar'),
        ],
      ),
    );
  }
}
