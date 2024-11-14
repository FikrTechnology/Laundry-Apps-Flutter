part of 'pages.dart';

class ProgressListPage extends StatefulWidget {
  const ProgressListPage({super.key});

  @override
  State<ProgressListPage> createState() => _ProgressListPageState();
}

class _ProgressListPageState extends State<ProgressListPage> {
  Stream<List<Onprogress>> getList() async* {
    List<Onprogress> data = await OnProgress().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'List antrian customer masuk',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: StreamBuilder<Object>(
              stream: getList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) Text(snapshot.error.toString());
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return const Center(child: Text('Tidak ada data'));
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data[index].toJson());
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: CardOnprogress(
                        date: snapshot.data[index].date,
                        name: snapshot.data[index].name,
                        onCardTap: () {
                          Navigator.pushNamed(context, AppRoutes.customerDetail,
                              arguments: snapshot.data[index]);
                        },
                        onButtonTap: () async {
                          try {
                            await initializeDateFormatting('id_ID', null);
                            String formattedDate =
                                DateFormat('d MMMM yyyy', 'id_ID')
                                    .format(DateTime.now());
                            String formattedTime =
                                DateFormat('HH:mm').format(DateTime.now());
                            Ondone done = Ondone(
                                name: snapshot.data[index].name,
                                address: snapshot.data[index].address,
                                phone: snapshot.data[index].phone,
                                weight: snapshot.data[index].weight,
                                amount: snapshot.data[index].amount,
                                package: snapshot.data[index].package,
                                dateIn: snapshot.data[index].date,
                                timeIn: snapshot.data[index].time,
                                dateOut: formattedDate,
                                timeOut: formattedTime);

                            await OnDone().simpan(done);

                            // Menghapus data dari tabel OnProgress setelah penyimpanan berhasil
                            await OnProgress().hapus(snapshot.data[index]);

                            // Navigasi setelah semua operasi berhasil
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.doneProgress);
                          } catch (e) {
                            print("Terjadi kesalahan: $e");
                          }
                        },
                      ),
                    );
                  },
                );
              }),
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
                onTap: () {},
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
