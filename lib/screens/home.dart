part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  // List pilihan paket laundry
  final Map<String, double> laundryPackages = {
    'Cuci Kering Setrika': 5000.0,
    'Cuci Saja': 3000.0,
    'Setrika Saja': 2000.0,
    'Cuci Express (Selesai 1 Hari)': 7000.0,
    'Cuci Selimut': 10000.0,
  };

  // Paket yang dipilih oleh pengguna
  String? selectedPackage;

  // Berat laundry dalam kg (diinput oleh pengguna)
  double weight = 0.0;

  // Harga yang dihitung (harga = berat * harga per kg dari paket terpilih)
  double calculatedPrice = 0.0;

  // Function untuk menghitung harga berdasarkan berat dan paket
  void calculatePrice() {
    if (selectedPackage != null && weight > 0) {
      setState(() {
        calculatedPrice = weight * laundryPackages[selectedPackage!]!;
      });
    } else {
      setState(() {
        calculatedPrice = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Input data Customer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nama Customer',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE78F81), // Warna border ketika fokus
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Radius untuk border
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE78F81), // Warna border ketika fokus
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Radius untuk border
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE78F81), // Warna border ketika fokus
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Radius untuk border
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Pilih Paket Laundry",
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE78F81), // Warna border ketika fokus
                      ),
                      borderRadius:
                          BorderRadius.circular(8), // Radius untuk border
                    ),
                  ),
                  value: selectedPackage,
                  items: laundryPackages.keys.map((package) {
                    return DropdownMenuItem<String>(
                      value: package,
                      child: Text(package),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedPackage = newValue;
                    });
                    calculatePrice(); // Hitung harga saat paket diubah
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Berat",
                          labelStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(
                                  0xFFE78F81), // Warna border ketika fokus
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Radius untuk border
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(
                                right:
                                    8.0), // Memberikan jarak antara teks "KG" dan input
                            child: Text(
                              "Kg",
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            weight = double.tryParse(value) ?? 0.0;
                          });
                          calculatePrice(); // Hitung harga saat berat diubah
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Field untuk menampilkan harga (tidak bisa di-edit)
                    Flexible(
                      flex: 3,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: "Harga Total",
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Radius untuk border
                          ),
                        ),
                        readOnly: true, // Field tidak dapat diubah
                        controller: TextEditingController(
                          text: calculatedPrice > 0
                              ? 'Rp ${calculatedPrice.toStringAsFixed(0)}'
                              : 'Rp 0',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 1, 48),
                    backgroundColor: const Color(0xFFE78F81),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: const Color(0xFFB7E0FF),
        indicatorColor: const Color(0xFFE78F81),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            // selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.archive_rounded)),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.domain_verification_rounded),
            label: 'Done',
          ),
        ],
      ),
    );
  }
}
