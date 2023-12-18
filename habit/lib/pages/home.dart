import 'package:flutter/material.dart';
import 'package:habit/components/floating_action.dart';
import 'package:habit/components/habit_title.dart';
import 'package:habit/components/monthly_summery.dart';
import 'package:habit/components/my_alert_box.dart';
import 'package:habit/data/habit_database.dart';
import 'package:habit/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    else {
      db.loadData();
    }

    db.updateDatabase();

    super.initState();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
   
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter habit name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  void saveNewHabit() {
    
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });

   
    _newHabitNameController.clear();
    
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void cancelDialogBox() {
  
    _newHabitNameController.clear();

   
    Navigator.of(context).pop();
  }

  
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }


  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

 
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
          onPressed: (){
             signout(context);

          },
           icon: Icon(Icons.exit_to_app))
        ],
      ),
      backgroundColor: Colors.grey[300],
      floatingActionButton:MyFloatActionButton(onpressed: createNewHabit),
      body: ListView(
        children: [
       
          MonthlySummary(
            datasets: db.heatMapDataSet,
            startDate: _myBox.get("START_DATE"),
          ),

       
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value, index),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            },
          )
        ],
      ),
    );
  }



   signout(BuildContext ctx)async{
    final _sharedperfer = await SharedPreferences.getInstance();
    await _sharedperfer.clear();
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>Loginpage()), (route) => false);
  }
}