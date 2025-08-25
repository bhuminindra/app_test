import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1; // default halaman Home

  final List<Widget> _pages = [
    const ProfilePage(),
    const HomePage(),
    const DetailPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: Colors.yellow[700],
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Detail',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> services = const [
    {"icon": Icons.motorcycle, "label": "Ride"},
    {"icon": Icons.fastfood, "label": "Food"},
    {"icon": Icons.local_shipping, "label": "Send"},
    {"icon": Icons.shopping_bag, "label": "Shop"},
    {"icon": Icons.payment, "label": "Pay"},
    {"icon": Icons.more_horiz, "label": "More"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Delivery App"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.yellow),
          onPressed: () {}, 
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner promo
    Container(
  margin: const EdgeInsets.all(16),
  height: 180,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    image: const DecorationImage(
      image: AssetImage("lib/assets/banner.jpg"), 
      fit: BoxFit.cover,
    ),
  ),
),

            const SizedBox(height: 16),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8, 
                  mainAxisSpacing: 8,  
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ServiceDetailPage(
                            title: service["label"],
                            icon: service["icon"],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.yellow[700],
                          radius: 32,
                          child: Icon(
                            service["icon"],
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          service["label"],
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
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
}


class ServiceDetailPage extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceDetailPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        automaticallyImplyLeading: true, // back otomatis
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: Colors.yellow[700],
              radius: 50,
              child: Icon(icon, color: Colors.black, size: 40),
            ),
            const SizedBox(height: 20),
            Text(
              "$title Service",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Praesent vulputate, nulla in tempus rhoncus, sapien dui "
              "ullamcorper massa, sed fermentum felis leo eget mauris.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        automaticallyImplyLeading: true, // back otomatis
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://source.unsplash.com/200x200/?portrait,person",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Bhuminindra",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("bhuminindra@email.com",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.yellow),
                title: const Text("Order History"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.yellow),
                title: const Text("Settings"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        centerTitle: true,
        automaticallyImplyLeading: true, // back otomatis
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(Icons.delivery_dining, size: 80, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Layanan Pengiriman Cepat",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Kami menyediakan layanan pengiriman cepat, aman, dan terpercaya. "
            "Pesanan Anda akan sampai tujuan dengan selamat.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
