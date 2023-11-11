import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable
{

  final String errorMessage;

 const ErrorMessageModel(
     this.errorMessage,
     );
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(

      json["error"],

    );
  }

  @override
  List<Object?> get props =>
      [

        errorMessage,

      ];


}