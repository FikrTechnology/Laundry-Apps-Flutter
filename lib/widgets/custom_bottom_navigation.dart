part of 'widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<Widget> pages; // List of pages for navigation
  final int initialIndex; // Starting index for the navigation
  const CustomBottomNavigationBar(
      {Key? key, required this.pages, this.initialIndex = 0})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reusable Bottom Nav Bar'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: widget.pages, // The list of pages passed to the widget
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Update the page on tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
        ],
      ),
    );
  }
}
