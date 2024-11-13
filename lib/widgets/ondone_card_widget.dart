part of 'widgets.dart';

class CardOndone extends StatelessWidget {
  final String date;
  final String name;
  final VoidCallback onCardTap;

  const CardOndone({super.key,
    required this.date,
    required this.name,
    required this.onCardTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 9,
                        color: Color(0xFF5E5E5E)),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF80FFA2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 9,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}