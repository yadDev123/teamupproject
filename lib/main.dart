import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(TeamUpWebsite());
}

class TeamUpWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamUp Website',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 70.0, // Increased title size
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 20.0,
            color: Colors.black54,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hero Section
              _buildHeroSection(context),

              // Features Section
              _buildFeaturesSection(context),

              // Screenshots Section
              _buildScreenshotsSection(),

              // About Us Section
              _buildAboutUsSection(context),

              // Call to Action Section
              _buildCallToActionSection(context),

              // Padding before Contact Us
              SizedBox(height: 40),

              // Contact Info Section
              _buildContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.blueAccent.withOpacity(0.1),
      child: Column(
        children: [
          Text(
            'TeamUp – The Easy Way to Manage Your Employees',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Simplify workforce management, generate reports, and assign tasks all in one place.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded button
              ),
              foregroundColor: Colors.orangeAccent,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Features',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Centered title
          ),
          SizedBox(height: 30), // Increased padding
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFeatureTile(
                  icon: Icons.people, title: 'Manage Employees', description: 'Track and manage your employees with ease.'),
              _buildFeatureTile(
                  icon: Icons.assignment, title: 'Assign Tasks', description: 'Assign and track tasks seamlessly.'),
              _buildFeatureTile(
                  icon: Icons.report, title: 'Generate Reports', description: 'Detailed performance and task reports.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile({required IconData icon, required String title, required String description}) {
    return Column(
      children: [
        Icon(icon, size: 50, color: Colors.blueAccent),
        SizedBox(height: 10),
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Rounded feature tile
            color: Colors.blueAccent.withOpacity(0.1),
          ),
          child: Text(description, textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget _buildScreenshotsSection() {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text('App Screenshots', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            alignment: WrapAlignment.center,
            children: [
              _buildScreenshotPlaceholder(),
              _buildScreenshotPlaceholder(),
              _buildScreenshotPlaceholder(),
              _buildScreenshotPlaceholder(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScreenshotPlaceholder() {
    return Container(
      width: 220,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Rounded screenshot placeholder
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      child: Center(child: Text('Placeholder')),
    );
  }

  Widget _buildAboutUsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          Text('About Us', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(
            'TeamUp is dedicated to helping managers run their teams more efficiently. Our mission is to streamline workforce management, giving managers the tools they need to succeed.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCallToActionSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.blueAccent.withOpacity(0.1),
      child: Column(
        children: [
          Text('Ready to Get Started?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded button
              ),
              foregroundColor: Colors.orangeAccent,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blueAccent.withOpacity(0.1),
      child: GestureDetector(
        onTap: () async {
          final Uri emailUri = Uri(
            scheme: 'mailto',
            path: 'maple@maplelirium.com',
          );
          if (await canLaunch(emailUri.toString())) {
            await launch(emailUri.toString());
          }
        },
        child: Text(
          'Contact Us: maple@maplelirium.com',
          style: TextStyle(fontSize: 20, color: Colors.blueAccent),
        ),
      ),
    );
  }
}
