class EventRegistrant {
  EventRegistrant({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.eventType,
    required this.attendanceDate,
    required this.needCertificate,
  });

  final String fullName;
  final String email;
  final String phone;
  final String gender;
  final String eventType;
  final DateTime attendanceDate;
  final bool needCertificate;
}
