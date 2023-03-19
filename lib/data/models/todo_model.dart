import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

enum Filter {
  all,
  active,
  completed
}

class Todo extends Equatable {
  final String id;
  final String description;
  final bool completed;

  Todo({
    String? id,
    required this.description,
    this.completed = false,
  }) : this.id = id ?? uuid.v4();

  // Factory method to create a new Todo object from a map
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      description: map['description'],
      completed: map['completed'],
    );
  }

  // Method to convert the Todo object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'completed': completed,
    };
  }

  // Method to update the completion status of the Todo object
  Todo toggleCompletion() {
    return Todo(
      id: id,
      description: description,
      completed: !completed,
    );
  }

  @override
  List<Object?> get props => [id, description, completed];

  @override
  String toString() {
    return 'Todo{id: $id, description: $description, completed: $completed}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      description: json['description'],
      completed: json['completed'],
    );
  }
}
