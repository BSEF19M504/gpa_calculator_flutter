import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final semesters = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  int placeholder = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            const Text(
              'Welcome to GPA Calculator',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/semesters');
              },
              child: const Text('Define Grading Criteria'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Semesters: '),
                DropdownButton(
                  items: semesters.map((semester) {
                    return DropdownMenuItem(
                      value: semester,
                      child: Text("$semester"),
                    );
                  }).toList(),
                  onChanged: (semester){
                    setState(() {
                      placeholder = semester as int;
                    });
                  },
                  value: placeholder == 0 ? null : placeholder,
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (placeholder == 0)
              const Expanded(
                child: Center(
                  child: Text('Please select the number of semesters'),
                ),
              ),
            if (placeholder != 0)
              Expanded(
                child: ListView.builder(
                  itemCount: placeholder,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Semester ${index + 1}'),
                      onTap: () {},
                    );
                  }
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Calculate')),
          ],
        ),
      ),
    );
  }
}