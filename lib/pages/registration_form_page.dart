import 'package:flutter/material.dart';
import 'package:ilyasa_033_tugas5/models/event_registrant.dart';
import 'package:ilyasa_033_tugas5/providers/registration_provider.dart';
import 'package:provider/provider.dart';

class RegistrationFormPage extends StatefulWidget {
  const RegistrationFormPage({
    super.key,
    required this.onSaved,
    this.editIndex,
    this.editingRegistrant,
  });

  final int? editIndex;
  final EventRegistrant? editingRegistrant;
  final VoidCallback onSaved;

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  String _gender = 'Laki-laki';
  String _eventType = 'Seminar';
  DateTime? _attendanceDate;
  bool _needCertificate = false;

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RegistrationFormPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.editIndex != oldWidget.editIndex &&
        widget.editingRegistrant != null &&
        widget.editIndex != null) {
      final data = widget.editingRegistrant!;
      _fullNameCtrl.text = data.fullName;
      _emailCtrl.text = data.email;
      _phoneCtrl.text = data.phone;
      _gender = data.gender;
      _eventType = data.eventType;
      _attendanceDate = data.attendanceDate;
      _needCertificate = data.needCertificate;
      _currentStep = 0;
      setState(() {});
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _fullNameCtrl.clear();
    _emailCtrl.clear();
    _phoneCtrl.clear();
    _gender = 'Laki-laki';
    _eventType = 'Seminar';
    _attendanceDate = null;
    _needCertificate = false;
    _currentStep = 0;
    setState(() {});
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _attendanceDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) {
      setState(() => _attendanceDate = picked);
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Nama wajib diisi';
    if (value.trim().length < 3) return 'Minimal 3 karakter';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email wajib diisi';
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!regex.hasMatch(value.trim())) return 'Format email tidak valid';
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return 'No HP wajib diisi';
    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value.trim())) {
      return 'Isi 10-15 angka';
    }
    return null;
  }

  String? _validateDate() {
    if (_attendanceDate == null) return 'Tanggal kehadiran wajib dipilih';
    return null;
  }

  Future<void> _submit() async {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (!formValid || _validateDate() != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Periksa data form terlebih dahulu.')),
      );
      return;
    }

    final provider = context.read<RegistrationProvider>();
    final registrant = EventRegistrant(
      fullName: _fullNameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      gender: _gender,
      eventType: _eventType,
      attendanceDate: _attendanceDate!,
      needCertificate: _needCertificate,
    );

    try {
      if (widget.editIndex != null) {
        provider.updateRegistrant(widget.editIndex!, registrant);
      } else {
        provider.addRegistrant(registrant);
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.editIndex != null
                ? 'Data pendaftar berhasil diperbarui.'
                : 'Pendaftaran berhasil disimpan.',
          ),
        ),
      );
      widget.onSaved();
      _resetForm();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.editIndex != null;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          } else {
            _submit();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        onStepTapped: (step) => setState(() => _currentStep = step),
        controlsBuilder: (context, details) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(_currentStep == 2 ? (isEdit ? 'Update' : 'Submit') : 'Lanjut'),
              ),
              const SizedBox(width: 12),
              if (_currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Kembali'),
                ),
            ],
          );
        },
        steps: [
          Step(
            title: const Text('Data Pribadi'),
            isActive: _currentStep >= 0,
            content: Column(
              children: [
                TextFormField(
                  controller: _fullNameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneCtrl,
                  decoration: const InputDecoration(
                    labelText: 'No HP',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: _validatePhone,
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Detail Event'),
            isActive: _currentStep >= 1,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Jenis Kelamin'),
                RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Laki-laki'),
                  value: 'Laki-laki',
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value!),
                ),
                RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Perempuan'),
                  value: 'Perempuan',
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value!),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _eventType,
                  decoration: const InputDecoration(
                    labelText: 'Jenis Event',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Seminar', child: Text('Seminar')),
                    DropdownMenuItem(value: 'Workshop', child: Text('Workshop')),
                    DropdownMenuItem(value: 'Bootcamp', child: Text('Bootcamp')),
                  ],
                  onChanged: (value) => setState(() => _eventType = value!),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Konfirmasi'),
            isActive: _currentStep >= 2,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Tanggal Kehadiran',
                      border: const OutlineInputBorder(),
                      errorText: _validateDate(),
                    ),
                    child: Text(
                      _attendanceDate == null
                          ? 'Pilih tanggal'
                          : '${_attendanceDate!.day}/${_attendanceDate!.month}/${_attendanceDate!.year}',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Saya membutuhkan sertifikat'),
                  value: _needCertificate,
                  onChanged: (value) => setState(() => _needCertificate = value ?? false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
