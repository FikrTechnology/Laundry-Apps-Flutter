part of 'pages.dart';

class UpdateCustomerPage extends StatefulWidget {
  final Onprogress customerDetailOnProgressUpdate;
  const UpdateCustomerPage(
      {super.key, required this.customerDetailOnProgressUpdate});

  @override
  State<UpdateCustomerPage> createState() => _UpdateCustomerPageState();
}

class _UpdateCustomerPageState extends State<UpdateCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCustomerCtrl = TextEditingController();
  final TextEditingController _noTlpCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _packageCtrl = TextEditingController();
  final TextEditingController _weightCtrl = TextEditingController();
  final TextEditingController _ammountCtrl = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Paket yang dipilih oleh pengguna
  String? selectedPackage;

  Future<Onprogress> getData() async {
    Onprogress data = await OnProgress()
        .getById(widget.customerDetailOnProgressUpdate.id.toString());
    setState(() {
      _nameCustomerCtrl.text = data.name;
      _noTlpCtrl.text = data.phone;
      _addressCtrl.text = data.address;
      _packageCtrl.text = data.package;
      _weightCtrl.text = data.weight;
      _ammountCtrl.text = data.amount;
      _priceController.text = 'Rp ${data.amount}';
      selectedPackage = data.package;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // List pilihan paket laundry
  final Map<String, double> laundryPackages = {
    'Cuci Kering Setrika': 5000,
    'Cuci Saja': 3000,
    'Setrika Saja': 2000,
    'Cuci Express (Selesai 1 Hari)': 7000,
    'Cuci Selimut': 10000,
  };

  // Berat laundry dalam kg (diinput oleh pengguna)
  int weight = 0;

  // Harga yang dihitung (harga = berat * harga per kg dari paket terpilih)
  int calculatedPrice = 0;

  // Function untuk menghitung harga berdasarkan berat dan paket
  void calculatePrice() {
    if (selectedPackage != null && weight > 0) {
      setState(() {
        calculatedPrice = (weight * laundryPackages[selectedPackage!]!).toInt();
        _ammountCtrl.text = calculatedPrice.toString();
        _priceController.text = 'Rp ${calculatedPrice.toStringAsFixed(0)}';
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Update data Customer',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Harap isi nama customer';
                      }
                      return null;
                    },
                    maxLength: 20,
                    controller: _nameCustomerCtrl,
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Harap isi nomor telepon';
                      }
                      return null;
                    },
                    maxLength: 13,
                    controller: _noTlpCtrl,
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Harap isi alamat customer';
                      }
                      return null;
                    },
                    maxLength: 50,
                    controller: _addressCtrl,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Harap pilih paket laundry';
                      }
                      return null;
                    },
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
                        _packageCtrl.text = newValue.toString();
                      });
                      calculatePrice(); // Hitung harga saat paket diubah
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Harap isi berat laundry';
                            }
                            return null;
                          },
                          maxLength: 2,
                          controller: _weightCtrl,
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
                              borderRadius: BorderRadius.circular(
                                  8), // Radius untuk border
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
                            counterText: '',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              weight = int.tryParse(value) ?? 0;
                            });
                            calculatePrice(); // Hitung harga saat berat diubah
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Field untuk menampilkan harga (tidak bisa di-edit)
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "Harga Total",
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Radius untuk border
                            ),
                          ),
                          readOnly: true, // Field tidak dapat diubah
                          controller: _priceController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Onprogress data = Onprogress(
                            name: _nameCustomerCtrl.text,
                            address: _addressCtrl.text,
                            phone: _noTlpCtrl.text,
                            weight: _weightCtrl.text,
                            amount: _ammountCtrl.text,
                            package: _packageCtrl.text,
                            date: widget.customerDetailOnProgressUpdate.date,
                            time: widget.customerDetailOnProgressUpdate.time);
                        String id =
                            widget.customerDetailOnProgressUpdate.id.toString();
                        await OnProgress().ubah(data, id).then((onValue) {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.onProgress);
                        });
                      }
                    },
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          height: 60,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: const Color(0xFFB7E0FF),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                },
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: 24,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.onProgress);
                },
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    color: Color(0xFFF5D2CD),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                    child: SvgPicture.asset(
                      'assets/icons/onprogress.svg',
                      width: 24,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.doneProgress);
                },
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                    child: SvgPicture.asset(
                      'assets/icons/success.svg',
                      width: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
