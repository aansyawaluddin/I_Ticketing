import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:frontend/spv/working.dart';
import 'package:frontend/spv/notification.dart';
import 'package:frontend/spv/account.dart';
import 'package:frontend/spv/button_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Working()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccountPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              "Dashboard",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFEAEAEA),
      ),
      body: Container(
        color: const Color(0xFFEAEAEA),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('All Ticket', 25, screenWidth),
                _buildInfoCard('Solve', 10, screenWidth),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('To Do', 5, screenWidth),
                _buildInfoCard('Over Due', 25, screenWidth),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Daily Grafik',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.02, top: screenHeight * 0.01),
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.25,
                child: Stack(
                  children: [
                    BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: Colors.red,
                                width: screenWidth * 0.07,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 5,
                                color: Colors.yellow,
                                width: screenWidth * 0.07,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: 10,
                                color: Colors.green,
                                width: screenWidth * 0.07,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 7,
                                color: Colors.green,
                                width: screenWidth * 0.07,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: Colors.green,
                                width: screenWidth * 0.07,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                toY: 4,
                                color: Colors.green,
                                width: screenWidth * 0.07,
                                borderRadius: BorderRadius.zero,
                              ),
                            ],
                          ),
                        ],
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                      ),
                    ),
                    Positioned.fill(
                      child: CustomPaint(
                        painter: LinePainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Penunjukan Tim',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('All Ticket', 25, screenWidth),
                _buildInfoCard('Assign', 10, screenWidth),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('Not Assign', 10, screenWidth),
                _buildInfoCard('Pending', 5, screenWidth),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildInfoCard(String title, int count, double screenWidth) {
    return Card(
      elevation: 0.5,
      color: const Color.fromARGB(255, 253, 251, 251),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.01),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        width: screenWidth * 0.4,
        height: screenWidth * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: const Color(0XFFA6A6A6),
                    ),
                  ),
                  Text(
                    '$count',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Garis vertikal
    canvas.drawLine(
      Offset(size.width * 0.1 - 37, 0),
      Offset(size.width * 0.1 - 37, size.height),
      paint,
    );

    // Garis horizontal
    canvas.drawLine(
      Offset(size.width * 0.0, size.height),
      Offset(size.width * 0.95, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}