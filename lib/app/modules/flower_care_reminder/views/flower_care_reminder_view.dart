import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class FlowerCareReminderView extends StatefulWidget {
  const FlowerCareReminderView({Key? key}) : super(key: key);

  @override
  State<FlowerCareReminderView> createState() => _FlowerCareReminderViewState();
}

class _FlowerCareReminderViewState extends State<FlowerCareReminderView> {
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> tasks = [
    {
      'status': 'Harian',
      'title': 'Menyiram Tanaman',
      'time': '10:00 - 11:00 WIB',
      'color': Colors.purple
    },
    {
      'status': 'Harian',
      'title': 'Mengecek Kondisi',
      'time': '12:00 - 13:00 WIB',
      'color': Colors.orange
    },
    {
      'status': '3 Hari',
      'title': 'Menghitung Stok',
      'time': '16:00 - 16:45 WIB',
      'color': Colors.blue
    },
    {
      'status': '1 Minggu',
      'title': 'Belanja Stok',
      'time': '04:00 - 05:00 WIB',
      'color': Colors.pink
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<DateTime> upcomingDates = List.generate(
      10,
      (index) => DateTime.now().add(Duration(days: index)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengingat Perawatan Tanaman',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        backgroundColor: Colors.green.withOpacity(0.8),
        child: Icon(
          Icons.add, 
          color: Colors.white,
        ),
        shape: CircleBorder(), 
        mini: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              DateFormat('MMMM, d').format(selectedDate),
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: upcomingDates.map((date) {
                  bool isSelected = date.day == selectedDate.day &&
                      date.month == selectedDate.month &&
                      date.year == selectedDate.year;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                    color: Colors.green.withOpacity(0.4),
                                    blurRadius: 10)
                              ]
                            : [],
                      ),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('d').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('EEE').format(date),
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Tugas Harian',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        tasks.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${task['title']} dihapus")),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: buildTaskCard(
                      task['status'],
                      task['title'],
                      task['time'],
                      task['color'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAddTaskDialog(BuildContext context) {
    final _statusController = TextEditingController();
    final _titleController = TextEditingController();
    final _timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Tambah Tugas Baru"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _statusController,
                decoration: const InputDecoration(labelText: "Status"),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Judul Tugas"),
              ),
              TextField(
                controller: _timeController,
                decoration: const InputDecoration(
                    labelText: "Waktu (e.g., 10:00 - 11:00 WIB)"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal", style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add({
                    'status': _statusController.text,
                    'title': _titleController.text,
                    'time': _timeController.text,
                    'color': Colors.blue, 
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text("Tambah",style: TextStyle(color: Colors.green),),
            ),
          ],
        );
      },
    );
  }

  Widget buildTaskCard(String status, String title, String time, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              CircleAvatar(backgroundColor: Colors.grey[300], radius: 12),
              Positioned(
                  left: 15,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[400], radius: 12)),
              Positioned(
                  left: 30,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[500], radius: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
