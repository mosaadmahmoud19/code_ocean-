
import 'package:code_ocean/core/services/services_locator.dart';
import 'package:code_ocean/core/utils/enums.dart';
import 'package:code_ocean/ocean/presentation/controllers/time_line_page/time_line_bloc.dart';
import 'package:code_ocean/ocean/presentation/controllers/time_line_page/time_line_event.dart';
import 'package:code_ocean/ocean/presentation/controllers/time_line_page/time_line_state.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeLineScreen extends StatelessWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RoadMapTimeLineBloc>()
      ..add(const GetRoadMapTimeLineWeekEvent(
        roadmapUuid: "524853ce-cf9b-4fe0-a0f3-f0a4a2cdbe18",
      ))
      ..add(const GetRoadMapTimeLineDayEvent(
        sprintUuid: "34aeacc4-1428-49e3-9463-5750d06974b5",
      )),

      lazy: false,
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0XFFFFFFFF),
          elevation: 0.0,
        ),
        body: TimeLineContentScreen(),
      ),
    );
  }
}

class TimeLineContentScreen extends StatelessWidget {
  const TimeLineContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadMapTimeLineBloc,RoadMapTimeLineState>(
        builder: (context, state)
        {
          switch (state.stateRoadMapTimeLine) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return  Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:const EdgeInsetsDirectional.only(
                          start: 150.0,
                          bottom: 20.0
                        ),
                        child: Row(
                          children:
                         const [
                            Text(
                              'Company Nam',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF223E6D),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Image(image: AssetImage('assets/images/code_ocean.png')),
                          ],
                    ),
                      ),
                      Center(
                        child: const Text(
                          'PROJECT NAME',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF223E6D),
                          ),
                        ),
                      ),
                      DropdownButton<String>(

                        value: state.selectedDate,
                        items: state.months.map((String month) {
                          return DropdownMenuItem<String>(
                            value:
                            "$month ${state.selectedDate.split(" ")[1]}", // Combine selected month with the year part.
                            child: Text("$month ${state.selectedDate.split(" ")[1]}"),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          BlocProvider.of<RoadMapTimeLineBloc>(context).add(ToggleSelectData(newValue!));

                        },

                      ),

                      DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Container(
                              child: const TabBar(
                                labelColor: Colors.black,
                                padding: EdgeInsetsDirectional.only(
                                  start: 190.0,
                                ),
                                indicatorColor: Colors.green,
                                unselectedLabelColor: Colors.grey,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  Tab(
                                    text: 'day',
                                  ),
                                  Tab(
                                    text: 'week',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                start: 20.0,
                                top: 10.0,
                              ),
                              height: 700,

                              child: TabBarView(
                                children: [
                                  DefaultTabController(
                                    length: 7,
                                    child: Column(
                                      children: [
                                        Container(

                                          child:TabBar(

                                            unselectedLabelColor: Colors.black,
                                            indicatorSize: TabBarIndicatorSize.label,
                                            labelPadding: EdgeInsetsDirectional.zero,
                                            indicator: BoxDecoration(),
                                            labelColor: Colors.white,
                                            tabs: [
                                              Column(
                                                children:
                                                 [
                                                  Text(
                                                    '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.dayName.substring(0,3)}',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),

                                              Column(
                                                children:
                                                const [
                                                  Text(
                                                    'sun',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children:
                                                const [
                                                  Text(
                                                    'sun',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children:
                                                const [
                                                  Text(
                                                    'sun',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children:
                                                const [
                                                  Text(
                                                    'sun',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children:
                                                const [
                                                  Text(
                                                    'sun',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children:
                                                const [
                                                  Text(
                                                    'sun',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0XFF737881),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15.0,
                                                    backgroundColor: Colors.white,
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),



                                            ],
                                          ),

                                        ),

                                        Container(
                                          height: 600,

                                          child: TabBarView(

                                            children:
                                            [
                                              ListView.builder(


                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),


                                                                    Text(
                                                                      '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].percentage }',

                                                                      style: TextStyle(
                                                                        fontSize: 15.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 20.0,),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),
                                              ListView.builder(

                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Icon(
                                                                      Icons.access_time,
                                                                      size: 12.0,
                                                                      color:
                                                                      Color(0XFFFFFFFF),
                                                                    ),
                                                                    Text(
                                                                      '10:00 am',
                                                                      style: TextStyle(
                                                                        fontSize: 9.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),
                                              ListView.builder(

                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Icon(
                                                                      Icons.access_time,
                                                                      size: 12.0,
                                                                      color:
                                                                      Color(0XFFFFFFFF),
                                                                    ),
                                                                    Text(
                                                                      '10:00 am',
                                                                      style: TextStyle(
                                                                        fontSize: 9.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),
                                              ListView.builder(

                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Icon(
                                                                      Icons.access_time,
                                                                      size: 12.0,
                                                                      color:
                                                                      Color(0XFFFFFFFF),
                                                                    ),
                                                                    Text(
                                                                      '10:00 am',
                                                                      style: TextStyle(
                                                                        fontSize: 9.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),
                                              ListView.builder(

                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Icon(
                                                                      Icons.access_time,
                                                                      size: 12.0,
                                                                      color:
                                                                      Color(0XFFFFFFFF),
                                                                    ),
                                                                    Text(
                                                                      '10:00 am',
                                                                      style: TextStyle(
                                                                        fontSize: 9.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),
                                              ListView.builder(

                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Icon(
                                                                      Icons.access_time,
                                                                      size: 12.0,
                                                                      color:
                                                                      Color(0XFFFFFFFF),
                                                                    ),
                                                                    Text(
                                                                      '10:00 am',
                                                                      style: TextStyle(
                                                                        fontSize: 9.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),
                                              ListView.builder(

                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${state.roadMapTimeLineSprintsDay?.roadMapTimeLineDatesDataWeek.time.substring(0,5)}',
                                                            style: const TextStyle(
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Color(0XFF050F1F)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets.symmetric(
                                                                vertical: 10.0,
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .only(start: 10.0),
                                                                width: 280.0,
                                                                height: 42.0,
                                                                decoration: BoxDecoration(
                                                                    color: Color(0xFF85A8CE),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15.0)),
                                                                child: Row(
                                                                  children:  [
                                                                    Expanded(
                                                                      child: Text(
                                                                        '${state.roadMapTimeLineSprintsDay?.timeLineTasks[index].title }',
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color:
                                                                          Color(0XFFFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                    Icon(
                                                                      Icons.access_time,
                                                                      size: 12.0,
                                                                      color:
                                                                      Color(0XFFFFFFFF),
                                                                    ),
                                                                    Text(
                                                                      '10:00 am',
                                                                      style: TextStyle(
                                                                        fontSize: 9.0,
                                                                        color:
                                                                        Color(0XFFFFFFFF),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsDay?.timeLineTasks.length,

                                              ),


                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DefaultTabController(
                                    length: 4,
                                    child: Column(
                                      children: [
                                        Container(
                                          child:  const TabBar(
                                            labelPadding: EdgeInsetsDirectional.zero,
                                            indicatorWeight: 0.0,
                                            indicatorPadding: EdgeInsetsDirectional.zero,
                                            unselectedLabelColor: Colors.black,
                                            indicatorSize: TabBarIndicatorSize.label,
                                            indicator: BoxDecoration(),
                                            labelColor: Colors.white,
                                            tabs: [
                                              CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor: Colors.white,
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor: Colors.white,
                                                child: Text(
                                                  '2',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor: Colors.white,
                                                child: Text(
                                                  '3',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor: Colors.white,
                                                child: Text(
                                                  '4',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 600,

                                          child: TabBarView(

                                            children:
                                            [
                                              ListView.builder(
                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),

                                                      Row(

                                                        children: [
                                                          Column(

                                                            children:  [
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayName.substring(0,3)}',
                                                                style: TextStyle(
                                                                    fontSize: 15.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color:
                                                                    Color(0XFF050F1F)),
                                                              ),
                                                              SizedBox(
                                                                height: 5.0,
                                                              ),
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayDate.substring(6,10)}',
                                                                style: TextStyle(
                                                                    fontSize: 12.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    color:
                                                                    Color(0XFF223E6D)),
                                                              ),
                                                            ],
                                                          ),

                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                            ),
                                                            child: Container(
                                                              padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(start: 10.0),
                                                              width: 280.0,
                                                              height: 100.0,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xFF85A8CE),
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15.0)),
                                                              child: Row(
                                                                children:  [
                                                                  Column(
                                                                    children:
                                                                    [
                                                                       Padding(
                                                                        padding:  EdgeInsetsDirectional.only(

                                                                            top: 10.0
                                                                        ),
                                                                        child: Text(
                                                                          '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].name}',

                                                                          style: TextStyle(
                                                                            fontSize: 15.0,
                                                                            fontWeight: FontWeight.bold,
                                                                            color:
                                                                            Color(0XFFFFFFFF),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children:
                                                                        [
                                                                          Column(
                                                                            children:
                                                                            [
                                                                               Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].startDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                 [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 20.0,),
                                                                          Column(
                                                                            children:
                                                                            [
                                                                               Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].endDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                 [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),


                                                                           Padding(
                                                                            padding:  EdgeInsetsDirectional.only(
                                                                              start: 35.0,
                                                                              top: 28.0,

                                                                            ),
                                                                            child: CircleAvatar(
                                                                              radius: 15.0,
                                                                              child: Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints.length}',

                                                                                style: TextStyle(
                                                                                  fontSize: 20.0,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFFFFFFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),


                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),





                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsWeekEntities?.sprints.length,

                                              ),
                                              ListView.builder(
                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),

                                                      Row(

                                                        children: [
                                                          Column(

                                                            children:  [
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayName.substring(0,3)}',
                                                                style: TextStyle(
                                                                    fontSize: 15.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color:
                                                                    Color(0XFF050F1F)),
                                                              ),
                                                              SizedBox(
                                                                height: 5.0,
                                                              ),
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayDate.substring(6,10)}',
                                                                style: TextStyle(
                                                                    fontSize: 12.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    color:
                                                                    Color(0XFF223E6D)),
                                                              ),
                                                            ],
                                                          ),

                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                            ),
                                                            child: Container(
                                                              padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(start: 10.0),
                                                              width: 280.0,
                                                              height: 100.0,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xFF85A8CE),
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15.0)),
                                                              child: Row(
                                                                children:  [
                                                                  Column(
                                                                    children:
                                                                    [
                                                                      Padding(
                                                                        padding:  EdgeInsetsDirectional.only(

                                                                            top: 10.0
                                                                        ),
                                                                        child: Text(
                                                                          '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].name}',

                                                                          style: TextStyle(
                                                                            fontSize: 15.0,
                                                                            fontWeight: FontWeight.bold,
                                                                            color:
                                                                            Color(0XFFFFFFFF),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children:
                                                                        [
                                                                          Column(
                                                                            children:
                                                                            [
                                                                              Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].startDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 20.0,),
                                                                          Column(
                                                                            children:
                                                                            [
                                                                              Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].endDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),


                                                                          Padding(
                                                                            padding:  EdgeInsetsDirectional.only(
                                                                              start: 35.0,
                                                                              top: 28.0,

                                                                            ),
                                                                            child: CircleAvatar(
                                                                              radius: 15.0,
                                                                              child: Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints.length}',

                                                                                style: TextStyle(
                                                                                  fontSize: 20.0,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFFFFFFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),


                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),





                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsWeekEntities?.sprints.length,

                                              ),
                                              ListView.builder(
                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),

                                                      Row(

                                                        children: [
                                                          Column(

                                                            children:  [
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayName.substring(0,3)}',
                                                                style: TextStyle(
                                                                    fontSize: 15.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color:
                                                                    Color(0XFF050F1F)),
                                                              ),
                                                              SizedBox(
                                                                height: 5.0,
                                                              ),
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayDate.substring(6,10)}',
                                                                style: TextStyle(
                                                                    fontSize: 12.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    color:
                                                                    Color(0XFF223E6D)),
                                                              ),
                                                            ],
                                                          ),

                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                            ),
                                                            child: Container(
                                                              padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(start: 10.0),
                                                              width: 280.0,
                                                              height: 100.0,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xFF85A8CE),
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15.0)),
                                                              child: Row(
                                                                children:  [
                                                                  Column(
                                                                    children:
                                                                    [
                                                                      Padding(
                                                                        padding:  EdgeInsetsDirectional.only(

                                                                            top: 10.0
                                                                        ),
                                                                        child: Text(
                                                                          '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].name}',

                                                                          style: TextStyle(
                                                                            fontSize: 15.0,
                                                                            fontWeight: FontWeight.bold,
                                                                            color:
                                                                            Color(0XFFFFFFFF),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children:
                                                                        [
                                                                          Column(
                                                                            children:
                                                                            [
                                                                              Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].startDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 20.0,),
                                                                          Column(
                                                                            children:
                                                                            [
                                                                              Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].endDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),


                                                                          Padding(
                                                                            padding:  EdgeInsetsDirectional.only(
                                                                              start: 35.0,
                                                                              top: 28.0,

                                                                            ),
                                                                            child: CircleAvatar(
                                                                              radius: 15.0,
                                                                              child: Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints.length}',

                                                                                style: TextStyle(
                                                                                  fontSize: 20.0,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFFFFFFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),


                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),





                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsWeekEntities?.sprints.length,

                                              ),
                                              ListView.builder(
                                                itemBuilder: (context,index)
                                                {
                                                  return  Column(
                                                    children: [

                                                      const DottedDashedLine(
                                                        height: 0,
                                                        dashWidth: 20.0,
                                                        dashSpace: 35.0,
                                                        dashColor: Colors.black87,
                                                        width: double.infinity,
                                                        axis: Axis.horizontal,
                                                      ),
                                                      const SizedBox(
                                                        height: 15.0,
                                                      ),

                                                      Row(

                                                        children: [
                                                          Column(

                                                            children:  [
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayName.substring(0,3)}',
                                                                style: TextStyle(
                                                                    fontSize: 15.0,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color:
                                                                    Color(0XFF050F1F)),
                                                              ),
                                                              SizedBox(
                                                                height: 5.0,
                                                              ),
                                                              Text(
                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.dayDate.substring(6,10)}',
                                                                style: TextStyle(
                                                                    fontSize: 12.0,
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    color:
                                                                    Color(0XFF223E6D)),
                                                              ),
                                                            ],
                                                          ),

                                                          const SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                            ),
                                                            child: Container(
                                                              padding:
                                                              const EdgeInsetsDirectional
                                                                  .only(start: 10.0),
                                                              width: 280.0,
                                                              height: 100.0,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xFF85A8CE),
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15.0)),
                                                              child: Row(
                                                                children:  [
                                                                  Column(
                                                                    children:
                                                                    [
                                                                      Padding(
                                                                        padding:  EdgeInsetsDirectional.only(

                                                                            top: 10.0
                                                                        ),
                                                                        child: Text(
                                                                          '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].name}',

                                                                          style: TextStyle(
                                                                            fontSize: 15.0,
                                                                            fontWeight: FontWeight.bold,
                                                                            color:
                                                                            Color(0XFFFFFFFF),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children:
                                                                        [
                                                                          Column(
                                                                            children:
                                                                            [
                                                                              Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].startDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),
                                                                          SizedBox(width: 20.0,),
                                                                          Column(
                                                                            children:
                                                                            [
                                                                              Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].endDate}',

                                                                                style: TextStyle(
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFF1F5F8),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                children:
                                                                                [
                                                                                  Icon(
                                                                                    Icons.access_time,
                                                                                    color: Color(0xFFF1F5F8),
                                                                                    size: 15.0,
                                                                                  ),
                                                                                  Text(
                                                                                    '${state.roadMapTimeLineSprintsWeekEntities?.sprints[index].roadMapTimeLineDatesDataWeek.time}',

                                                                                    style: TextStyle(
                                                                                      fontSize: 9.0,
                                                                                      fontWeight:
                                                                                      FontWeight.bold,
                                                                                      color:
                                                                                      Color(0XFFFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),

                                                                            ],
                                                                          ),


                                                                          Padding(
                                                                            padding:  EdgeInsetsDirectional.only(
                                                                              start: 35.0,
                                                                              top: 28.0,

                                                                            ),
                                                                            child: CircleAvatar(
                                                                              radius: 15.0,
                                                                              child: Text(
                                                                                '${state.roadMapTimeLineSprintsWeekEntities?.sprints.length}',

                                                                                style: TextStyle(
                                                                                  fontSize: 20.0,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                  color:
                                                                                  Color(0XFFFFFFFF),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),


                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),





                                                    ],
                                                  );
                                                },
                                                itemCount:state.roadMapTimeLineSprintsWeekEntities?.sprints.length,

                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

    ) ;
  }
}




