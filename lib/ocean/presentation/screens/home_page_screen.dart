import 'package:code_ocean/core/services/services_locator.dart';
import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/presentation/controllers/home_page/home_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/home_page/home_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/home_page/home_state.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_state.dart';
import 'package:code_ocean/ocean/presentation/screens/app_schedule.dart';
import 'package:code_ocean/ocean/presentation/screens/app_timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePageScreen extends StatelessWidget {


  const HomePageScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      sl<HomeBloc>()
        ..add(GetHomePageEvent()),
      lazy: false,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.homeSate) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return Scaffold(
                backgroundColor: const Color(0xFF25415C),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF25415C),
                  elevation: 0.0,
                ),
                drawer: Drawer(
                  width: 180.0,
                  backgroundColor: Color(0xFF223E6D),

                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 20.0,
                          ),

                          child: Column(
                            children:
                            [
                              Row(
                                children:
                                [
                                  const CircleAvatar(
                                    radius: 15.0,
                                    backgroundColor: Colors.blue,
                                    backgroundImage: AssetImage(
                                        'assets/images/code_ocean.png'),
                                  ),
                                  Text(
                                    '${state.homePageEntities?.name}',
                                    style: const TextStyle(
                                      color: Color(0xFFF7F8F9),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),


                              Container(
                                height: 180.0,
                                width: 130,
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: ()
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePageScreen()
                                            ),
                                        );

                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF85A8CE),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),

                                        height: 50,

                                        child: Center(
                                          child: Text(
                                            '${state.homePageEntities
                                                ?.projects[index].name}',
                                            style: TextStyle(
                                              color: Color(0xFFF7F8F9),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 20.0,
                                    );
                                  },
                                  itemCount: state.homePageEntities!.projects
                                      .length,
                                ),
                              ),

                              SizedBox(
                                height: 400.0,
                              ),
                              Row(
                                children:
                                [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children:
                                    const [
                                      CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Color(0xFFF7F8F9),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          color: Color(0xFFF223E6D),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: Color(0xFFF7F8F9),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 45.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children:
                                    const [
                                      CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: Color(0xFFF7F8F9),
                                        child: Icon(
                                          Icons.home,
                                          color: Color(0xFFF223E6D),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Home',
                                        style: TextStyle(
                                          color: Color(0xFFF7F8F9),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      const Center(
                        child: Text(
                          'Project Name',
                          style: TextStyle(
                            color: Color(0xFFF7F8F9),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScheduleScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 205.0,
                          height: 110.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 107.0,
                                padding: EdgeInsetsDirectional.only(
                                    start: 30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'PROJECTS',
                                      style: TextStyle(
                                        color: Color(0xFF223E6D),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'TIMELINE',
                                      style: TextStyle(
                                        color: Color(0xFF223E6D),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Image(
                                image: AssetImage('assets/images/time.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      const SizedBox(
                        height: 30.0,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,

                        ),
                        child: ToggleSwitch(
                          minWidth: 150.0,
                          cornerRadius: 15.0,
                          activeBgColors: const [[Color(0xFF85A8CE)], [Color(
                              0xFF54B39B)
                          ]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Color(0xFFF7F8F9),
                          inactiveFgColor: Color(0xFF223E6D),
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: ['Start Date', 'End Date'],
                          radiusStyle: false,
                          onToggle: (index) {
                            BlocProvider.of<HomeBloc>(context).add(
                                ToggleDateEvent(index!));
                          },
                          borderWidth: 10.0,
                          fontSize: 15.0,
                          animate: true,
                          minHeight: 50.0,

                          dividerColor: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Container(
                            width: 190.0,
                            height: 82.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: 25.0,
                                start: 28.0,
                              ),
                              child: Text(
                                '${state.index == 0 ? state.homePageEntities
                                    ?.projects[state.index].startDate : state
                                    .homePageEntities?.projects[state.index].endDate}',
                                style: TextStyle(
                                  color: Color(0xFF223E6D),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 19.5,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children:
                            [
                              const Image(
                                image: AssetImage('assets/images/ellipse .png'),
                                height: 200.24,
                                width: 150.24,

                              ),
                              const Image(
                                image: AssetImage('assets/images/ellipse1.png'),
                                height: 200.24,
                                width: 150.24,
                              ),
                              Text(
                                '${state.homePageEntities?.projects[0]
                                    .getPercentage}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],

                          ),

                        ],
                      ),

                      const Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 10.0,
                          top: 100.0,
                        ),
                        child: Text(
                          'Powerd By Code Ocean',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F8F9),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              );
            case RequestState.error:
              return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }

}





