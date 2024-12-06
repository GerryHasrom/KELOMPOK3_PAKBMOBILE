import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controller/workout_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWorkoutProgressSection(context),
              SizedBox(height: 20),

              _buildTaskListSection(context),
              SizedBox(height: 20),

              _buildStatisticsGraphSection(context),
              SizedBox(height: 20),

              _buildWorkoutCalendarSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutProgressSection(BuildContext context) {
    return Consumer<WorkoutController>(
      builder: (context, workoutController, child) {
        double completionPercentage = workoutController.completionPercentage;
        int remainingTasks =
            workoutController.totalCount - workoutController.completedCount;

        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Workout Progress',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$remainingTasks Tasks Remaining',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 8.0,
                percent: completionPercentage,
                center: Text(
                  "${(completionPercentage * 100).toInt()}%",
                ),
                progressColor: Colors.blue[900],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaskListSection(BuildContext context) {
    return Consumer<WorkoutController>(
      builder: (context, workoutController, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Workout Tasks",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: workoutController.workoutList.isEmpty
                  ? Center(child: Text('No tasks available.'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: workoutController.workoutList.length,
                      itemBuilder: (context, index) {
                        final exercise =
                            workoutController.workoutList[index];
                        bool isCompleted = workoutController
                                .completedExercises[exercise['exercise_name']] ??
                            false;

                        return ListTile(
                          leading: Checkbox(
                            value: isCompleted,
                            onChanged: (value) {
                              workoutController.markAsCompleted(
                                  exercise['exercise_name']);
                            },
                          ),
                          title: Text(
                            exercise['exercise_name'],
                            style: TextStyle(
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatisticsGraphSection(BuildContext context) {
    return Consumer<WorkoutController>(
      builder: (context, workoutController, child) {
        List<Map<String, dynamic>> weeklyData = [
          {"day": "Mon", "progress": 0.6},
          {"day": "Tue", "progress": 0.7},
          {"day": "Wed", "progress": 0.8},
          {"day": "Thu", "progress": 0.5},
          {"day": "Fri", "progress": workoutController.completionPercentage},
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Workout Statistics",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Weekly Workout Progress'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<Map<String, dynamic>, String>>[
                  ColumnSeries<Map<String, dynamic>, String>(
                    dataSource: weeklyData,
                    xValueMapper: (data, _) => data['day'],
                    yValueMapper: (data, _) => data['progress'],
                    name: 'Progress',
                    color: Colors.blue[900],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildWorkoutCalendarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Workout Calendar",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue[700],
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue[900],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
