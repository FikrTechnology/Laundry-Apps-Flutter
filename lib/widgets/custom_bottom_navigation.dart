part of 'widgets.dart';

// Bottom Navigation Bar Widget
class BottomNavBar extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNavBar({required this.currentPageIndex, required this.onItemSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        height: 60,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: const Color(0xFFB7E0FF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, 'assets/icons/home.svg', 0),
            _buildNavItem(context, 'assets/icons/onprogress.svg', 1),
            _buildNavItem(context, 'assets/icons/success.svg', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, int index) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        height: 30,
        width: 50,
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
          color: currentPageIndex == index ? const Color(0xFFF5D2CD) : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
          child: SvgPicture.asset(iconPath, width: 24),
        ),
      ),
    );
  }
}
