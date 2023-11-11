import 'package:equatable/equatable.dart';

abstract class CodeOceanEvent extends Equatable
{
  const CodeOceanEvent();

}

class PostIdLoginCodeOceanEvent extends CodeOceanEvent
{
  final String loginId;

  const PostIdLoginCodeOceanEvent({required this.loginId});

  @override

  List<Object?> get props =>
      [
        loginId,
      ];

}