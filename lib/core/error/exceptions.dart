import 'package:code_ocean/core/network/error_message_data_source.dart';

class ServerException implements Exception
{
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });

}

