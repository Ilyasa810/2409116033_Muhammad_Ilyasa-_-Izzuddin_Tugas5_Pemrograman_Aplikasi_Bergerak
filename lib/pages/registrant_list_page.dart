import 'package:flutter/material.dart';
import 'package:ilyasa_033_tugas5/models/event_registrant.dart';
import 'package:ilyasa_033_tugas5/providers/registration_provider.dart';
import 'package:provider/provider.dart';

class RegistrantListPage extends StatelessWidget {
  const RegistrantListPage({super.key, required this.onEdit});

  final void Function(int index, EventRegistrant registrant) onEdit;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, _) {
        final allEvents = ['Semua', 'Seminar', 'Workshop', 'Bootcamp'];
        final items = provider.filteredRegistrants;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cari nama atau email',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: provider.setSearchQuery,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: provider.eventFilter,
                decoration: const InputDecoration(
                  labelText: 'Filter Event',
                  border: OutlineInputBorder(),
                ),
                items: allEvents
                    .map((event) => DropdownMenuItem(value: event, child: Text(event)))
                    .toList(),
                onChanged: (value) => provider.setEventFilter(value ?? 'Semua'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: items.isEmpty
                    ? const Center(child: Text('Belum ada data pendaftar.'))
                    : ListView.separated(
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final registrant = items[index];
                          final originalIndex = provider.registrants.indexOf(registrant);
                          return ListTile(
                            leading: const CircleAvatar(child: Icon(Icons.person)),
                            title: Text(registrant.fullName),
                            subtitle: Text(
                              '${registrant.email}\n${registrant.eventType} | ${registrant.gender}',
                            ),
                            isThreeLine: true,
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => onEdit(originalIndex, registrant),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
