import 'package:flutter/material.dart';
import 'package:todo_list_app/utils/toDo_List.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _controller = TextEditingController();
  List toDoList = [
    ['Learn App Development', false],
    ['Drink Coffee', false],
  ];

  void checkBoxChanged(int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Simple ToDo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskname: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index), 
              deleteFunction: (Context) => deleteTask(index),
              );
          }
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 20,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add new items',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
            )),
          FloatingActionButton(
            onPressed: saveNewTask, 
            child: Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}