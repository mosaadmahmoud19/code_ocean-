import 'package:code_ocean/core/services/services_locator.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/login_page/codeocean_state.dart';
import 'package:code_ocean/ocean/presentation/screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginScreen extends StatelessWidget {

   AppLoginScreen({Key? key}) : super(key: key);

final keyController = TextEditingController();
var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) =>
      sl<CodeOceanBloc>(),
      lazy: false,
      child: BlocBuilder<CodeOceanBloc,CodeOceanState>(
      builder: (context ,state)
      {

        return Scaffold(
          backgroundColor: const Color(0xFF25415C),

          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(

              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Image(
                      image: AssetImage('assets/images/login1.png'),
                      width: 382.0,
                      height: 428.0,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Padding(
                      padding:  EdgeInsetsDirectional.only(
                        start: 33.5,
                        bottom: 5.0,
                      ),
                      child: Text(
                        'insert your secret key',

                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14.0,
                          color: Color(0xFF85A8CE),

                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Container(
                        width: 358.48,
                        height: 65.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                        child: TextFormField(
                          controller: keyController,
                          onFieldSubmitted: (value)
                          {
                            if(formKey.currentState!.validate())
                            {
                              BlocProvider.of<CodeOceanBloc>(context).add(PostIdLoginCodeOceanEvent(
                                loginId: keyController.text,
                              ));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePageScreen(),
                                )
                              );

                            }
                          },
                          keyboardType: TextInputType.text,
                          validator:  (String? value) {
                            if (value!.isEmpty) {
                              return 'please inter yor key';
                            }
                          },

                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'KEY',
                            contentPadding: EdgeInsetsDirectional.only(
                                top: 15.0,
                                start: 40.0

                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal, // FontWeight.regular is equivalent to FontWeight.normal
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: 358.48,
                        height: 65.18,
                        decoration: BoxDecoration(
                          color: Color(0xFF0B1C48),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30.0),
                            onTap: () {
                              if(formKey.currentState!.validate())
                              {
                                BlocProvider.of<CodeOceanBloc>(context).add(PostIdLoginCodeOceanEvent(
                                  loginId: keyController.text,
                                ));


                              }
                            },
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF7F8F9),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        );
      },
      ),
    );
  }
}
