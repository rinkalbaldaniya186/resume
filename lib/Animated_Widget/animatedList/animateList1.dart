import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Person> people = [];
  final _listKey = GlobalKey<AnimatedListState>(); // Key for the AnimatedList

  void _addPerson(String personName, String personDesignation) {
    final newPerson = Person(personName, personDesignation);
    people.add(newPerson);
    // Animate the addition of the new person
    _listKey.currentState?.insertItem(people.length - 1);
  }

  @override
  void initState() {
    super.initState();
    // Prepopulate the list with initial values
    _addPerson('Manasi Konde', 'Web Developer');
    _addPerson('Rohan Chaudhary', 'Software Engineer');
    _addPerson('Vishal Chumbalkar', 'Software Engineer');
    _addPerson('Pranav Deshapande', 'Data Scientist');
    _addPerson('Jayesh Shinde', 'DevOps Engineer');
  }

  void _removePerson(int index) {
    _listKey.currentState!.removeItem(
      index,
          (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text(
              "Deleted",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 500),
    );
    people.removeAt(index);
  }

  void _showDialog() {
    final nameController = TextEditingController();
    final designationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Person'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: designationController,
                decoration: InputDecoration(labelText: 'Designation'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final designation = designationController.text;

                if (name.isNotEmpty && designation.isNotEmpty) {
                  _addPerson(name, designation);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: AnimatedList(
        key: _listKey, // Use the GlobalKey here
        initialItemCount: people.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(people[index], animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _showDialog,
        child: const Icon(Icons.add, color: Colors.green),
      ),
    );
  }

  Widget _buildItem(Person person, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        tileColor: Colors.grey[200],
        title: Text(
          person.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        subtitle: Text(
          person.designation,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            int index = people.indexOf(person); // Get the index of the person
            if (index != -1) {
              _removePerson(index);
            }
          },
        ),
      ),
    );
  }
}

class Person {
  final String name;
  final String designation;

  Person(this.name, this.designation);
}