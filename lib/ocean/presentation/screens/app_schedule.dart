import 'package:code_ocean/core/services/services_locator.dart';
import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/presentation/controllers/schedule_page/schedule_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/schedule_page/schedule_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/schedule_page/schedule_state.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/task_details_state.dart';
import 'package:code_ocean/ocean/presentation/screens/app_timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ScheduleScreen extends StatelessWidget {


  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<RoadMapScheduleBloc>()
            ..add(const GetRoadMapScheduleProjectEvent(
              uuidProject: 'e33761f3-4bf9-4141-a6d1-2a7960a6af0e',
            )),
      lazy: false,
      child: const Scaffold(
        body: ScheduleScreenContent(),
      ),
    );

  }
}

class ScheduleScreenContent extends StatelessWidget {
  const ScheduleScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RoadMapScheduleBloc,RoadMapScheduleState>(
      builder: (context,state)
      {

        switch (state.stateRoadMapSchedule) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return  Scaffold(
              backgroundColor: const Color(0XFFFFFFFF),

              appBar: AppBar(

                backgroundColor: const Color(0XFFFFFFFF),
                elevation: 0.0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(

                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Padding(
                        padding:  const EdgeInsetsDirectional.only(
                            start: 130.0
                        ),
                        child: Row(
                          children:
                          const [
                            Text(
                              'company name',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF223E6D),
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/images/code_ocean.png'),
                              width: 100.0,
                              height:100.0,
                            ),
                          ],
                        ),
                      ),
                       Text(
                        '${state.roadMapScheduleEntities?.name}',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Color(0XFF98A6BE),

                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.only(
                            right: 30.0
                        ),
                        width: 226.0,
                        animation: true,
                        lineHeight: 8.0,
                        animationDuration: 2500,
                        percent: 0.7,
                        progressColor: const Color(0XFF54B39B),
                        backgroundColor: const Color(0xFFF7BF12),
                        alignment: MainAxisAlignment.start,
                        barRadius: const Radius.circular(20.0),

                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Develop Schedule',
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF223E6D),

                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsetsDirectional.only(
                            top: 15.0,
                            start: 35.0
                        ),

                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index)
                        {


                          return  Row(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children:
                            [
                              Expanded(
                                child: Column(

                                  children:
                                   [
                                    Text(
                                      'sun',
                                      style: TextStyle(
                                        color:Color(0xFF6587B9),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${state.roadMapScheduleEntities!.roadMapMini[index].date.substring(6,10)}',

                                      style: TextStyle(
                                        color:Color(0xFF6587B9),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),

                              Column(
                                children:
                                [
                                  const CircleAvatar(
                                    radius: 5.0,
                                    backgroundColor: Color(0xFFF7BF12),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                    width: 2,
                                    height: 300,
                                    color: Color(0xFF6587B9),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              InkWell(

                                child: Column(

                                  children:
                                  [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        top: 15.0,
                                      ),
                                      child: Container(
                                        width: 270,
                                        height: 150.0,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:Radius.circular(30.0) ,
                                            topRight: Radius.circular(30.0) ,
                                            bottomRight:Radius.circular(30.0) ,
                                          ),
                                          color: Color(0XFFE8EEF7),
                                        ),
                                        child: Padding(
                                          padding:  const EdgeInsetsDirectional.only(
                                              top: 10.0,
                                              start: 30.0
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children:
                                            [

                                              Container(
                                                width: 153.0,
                                                height: 25.0,
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0),
                                                  ),
                                                  color: Color(0XFF54B39B),
                                                ),
                                                child:  Center(
                                                  child: Text(
                                                    '${state.roadMapScheduleEntities!.roadMapMini[index].name}',
                                                    style: const TextStyle(
                                                      color: Color(0XFFFFFFFF),
                                                      fontSize: 19,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                maxLines: 3,

                                                '${state.roadMapScheduleEntities?.roadMapMini[index].description}',




                                                style: const TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0,
                                                  color: Color(0XFF223E6D),
                                                  height: 1.2,


                                                ),
                                              ),

                                              const SizedBox(
                                                height: 15.0,
                                              ),
                                              Row(
                                                children:
                                                [
                                                  LinearPercentIndicator(
                                                    padding: const EdgeInsets.only(
                                                        right: 50.0
                                                    ),
                                                    width: 180,
                                                    animation: true,
                                                    lineHeight: 8.0,
                                                    animationDuration: 2500,
                                                    percent: 0.7,
                                                    progressColor: Color(0XFF54B39B),
                                                    backgroundColor: Color(0xFFF7BF12),
                                                    barRadius: Radius.circular(20.0),

                                                  ),

                                                  Expanded(
                                                    child: Text(
                                                      '${state.roadMapScheduleEntities!.roadMapMini[index].percentage}',
                                                      style: TextStyle(

                                                        color: Color(0XFF223E6D),
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),



                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: ()
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => TimeLineScreen(),
                                  )
                                  );
                                },
                              ),
                            ],

                          );


                        },

                        itemCount: state.roadMapScheduleEntities?.roadMapMini.length ,

                      ),

                    ],
                  ),
                ),
              ),

            );
          case RequestState.error:
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}




