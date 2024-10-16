part of 'widgets.dart';

class TextFieldLeading extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;

  const TextFieldLeading({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: hintText,
              labelStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(
                icon,
                size: 20,
                color: Colors.grey[600],
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
                  color: Color(0xFFB7E0FF), // Warna border ketika fokus
                ),
                borderRadius: BorderRadius.circular(8), // Radius untuk border
              ),
            ),
          ),
        ],
      ),
    );
  }
}