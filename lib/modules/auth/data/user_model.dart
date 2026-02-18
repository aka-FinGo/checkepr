import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String fullName;
  final String role;

  const AppUser({
    required this.id,
    required this.fullName,
    required this.role,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      fullName: map['full_name'],
      role: map['role'],
    );
  }

  @override
  List<Object?> get props => [id, fullName, role];
}