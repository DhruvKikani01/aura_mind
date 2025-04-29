import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

Widget sessionCard({
  required String name,
  required String qualification,
  required String time,
  required String date,
  required VoidCallback onReschedule,
  required VoidCallback onSendMessage,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                    'assets/images/img_1.png'), // Replace with actual image
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    qualification,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 20, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 20),
                  const SizedBox(width: 5),
                  Text(time),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: 5),
                  Text(date),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onReschedule,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade600,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Reschedule'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: onSendMessage,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.yellow.shade600),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Send massage',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const IconButton(icon: Icon(Icons.arrow_back), color: Colors.black),
        title: const Text(
          'January 2025',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.arrow_forward, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('wed\n01', textAlign: TextAlign.center),
                  Text('Thu\n02', textAlign: TextAlign.center),
                  Text('Fri\n03', textAlign: TextAlign.center),
                  Text('Sat\n04', textAlign: TextAlign.center),
                  Text('Sun\n05', textAlign: TextAlign.center),
                  Text('Mon\n06',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.lightBlue)),
                  Text('Tue\n07', textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upcoming Session',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            sessionCard(
              name: 'Zehra tirpan',
              qualification: 'MSC in Clinical Psycologist',
              time: '11:00 AM - 12:00 AM',
              date: '6th January 2025',
              onReschedule: () {},
              onSendMessage: () {},
            ),
            sessionCard(
              name: 'Zehra tirpan',
              qualification: 'MSC in Clinical Psycologist',
              time: '2:30 PM - 3:30 PM',
              date: '6th January 2025',
              onReschedule: () {},
              onSendMessage: () {},
            ),
          ],
        ),
      ),
    );
  }
}
