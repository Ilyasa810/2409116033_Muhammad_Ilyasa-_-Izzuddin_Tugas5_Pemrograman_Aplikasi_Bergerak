import 'package:flutter/material.dart';
import 'package:ilyasa_033_tugas5/models/event_registrant.dart';

class RegistrationProvider extends ChangeNotifier {
  final List<EventRegistrant> _registrants = [];
  String _searchQuery = '';
  String _eventFilter = 'Semua';

  List<EventRegistrant> get registrants => List.unmodifiable(_registrants);
  String get searchQuery => _searchQuery;
  String get eventFilter => _eventFilter;

  List<EventRegistrant> get filteredRegistrants {
    return _registrants.where((item) {
      final matchSearch =
          _searchQuery.isEmpty ||
          item.fullName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.email.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchFilter = _eventFilter == 'Semua' || item.eventType == _eventFilter;
      return matchSearch && matchFilter;
    }).toList();
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void setEventFilter(String value) {
    _eventFilter = value;
    notifyListeners();
  }

  void addRegistrant(EventRegistrant registrant) {
    final isEmailUsed = _registrants.any(
      (item) => item.email.toLowerCase() == registrant.email.toLowerCase(),
    );
    if (isEmailUsed) {
      throw Exception('Email sudah terdaftar.');
    }
    _registrants.add(registrant);
    notifyListeners();
  }

  void updateRegistrant(int index, EventRegistrant registrant) {
    final isEmailUsed = _registrants.asMap().entries.any(
      (entry) =>
          entry.key != index &&
          entry.value.email.toLowerCase() == registrant.email.toLowerCase(),
    );
    if (isEmailUsed) {
      throw Exception('Email sudah dipakai pendaftar lain.');
    }
    _registrants[index] = registrant;
    notifyListeners();
  }
}
