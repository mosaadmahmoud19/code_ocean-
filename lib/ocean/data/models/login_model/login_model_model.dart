import 'package:code_ocean/ocean/domain/entities/login/login.dart';

class CodeOceanLoginModel extends CodeOceanLogin {

 const CodeOceanLoginModel(
      {
      required super.isEmployee,
      required super.isCompany,
      required super.isActive,
      });

 factory CodeOceanLoginModel.fromJson(Map<String , dynamic> json)
 {
   return CodeOceanLoginModel(
       isEmployee: json['is_employee'],
       isCompany: json['is_company'],
       isActive: json['is_active'],
   );
 }

}
