import 'package:equatable/equatable.dart';

class CodeOceanLogin extends Equatable
{

 final bool isEmployee;
 final bool isCompany;
 final bool isActive;

   const CodeOceanLogin({
    required this.isEmployee,
    required this.isCompany,
    required this.isActive,
});



  @override
  List<Object?> get props =>
      [
        isEmployee,
        isCompany,
        isActive,
      ];

}