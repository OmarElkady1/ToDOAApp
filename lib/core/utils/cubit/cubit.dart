
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app2/core/utils/cubit/states.dart';
import 'package:to_do_app2/presentation/to_do/all_tasks/all_tasks_page.dart';
import 'package:to_do_app2/presentation/to_do/complited_tasks/complited_tasks.dart';
import 'package:to_do_app2/presentation/to_do/favorite_task/favorite_task.dart';
import 'package:to_do_app2/presentation/to_do/uncompleted_task/uncompleted_task.dart';

class AppCubite extends Cubit<AppStates> {
  AppCubite() : super(IntitialState());
  static AppCubite get(context) => BlocProvider.of(context);

  DateTime selectedDate = DateTime.now();

  int selecredColor = 0;

  List<Colors> color = [];

  changeColorIndex(int index) {
    selecredColor = index;
    color[index];
    emit(IndexState());
  }

  int selectedIndex = 0;

  List<Widget> scrennss = [
    const AllTaskesPage(),
    const ComplitedTasks(),
    const UncomplitedTasks(),
    const FavoritePage()
  ];

  List<String> categories = ['All', 'Completed', 'Uncompleted', 'Favorite'];
  void changeIndex(int index) {
    selectedIndex = index;
    emit(IndexState());
  }

  List<bool> choices = [];

  void addAllChoices(List<Map> choicesList) {
    for (var element in choicesList) {
      choices.add(false);
      emit(IndexState());
    }
  }

  void onChanged2(bool value, int index) {
    choices[index] = value;
    emit(IndexState());
  }

  List<bool> isChecked = [];
  onChangedd(bool val, int index) {
    isChecked[index] = val;
    emit(IndexState());
  }

  Database? database;
  List<Map> allTaskesPage = [];
  List<Map> completedTasks = [];
  List<Map> unCompletedTasks = [];
  List<Map> favoriteTasks = [];

  Future createDatabase() async {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        emit(CreateDateBaseState());
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(CreateDateBaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(InserDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDatabase(database) {
    allTaskesPage = [];
    completedTasks = [];
    unCompletedTasks = [];
    favoriteTasks = [];

    emit(GetDatabaseState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      allTaskesPage = value;
      for (var i in value) {
        isChecked.add(false);
      }
      print(value.toString());

      value.forEach((element) {
        print(element['status']);

        if (element['status'] == 'completed') {
          completedTasks.add(element);
        } else if (element['status'] == 'favorite') {
          favoriteTasks.add(element);
        }
        //  (element['status'] == 'uncompleted')
        else {
          unCompletedTasks.add(element);
        }
      });

      emit(GetDatabaseState());
    });
  }

  void updateDate({required String status, required int id}) async {
    database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
      getDataFromDatabase(database);
      emit(UpdateDatabaseState());
    });
  }
}
