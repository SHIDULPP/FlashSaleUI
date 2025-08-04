import 'package:flutter/material.dart';

class DiscountSelector extends StatefulWidget {
  final Function(String) onSelected;

  const DiscountSelector({super.key, required this.onSelected});

  @override
  State<DiscountSelector> createState() => _DiscountSelectorState();
}

class _DiscountSelectorState extends State<DiscountSelector> {
  final List<String> discounts = ['All', '10%', '20%', '30%', '40%', '50%'];
  String selected = '20%';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: discounts.map((discount) {
          final bool isSelected = discount == selected;
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = discount;
              });
              widget.onSelected(discount);
            },
            child: AnimatedContainer(
              duration: const Duration(microseconds: 100),
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: isSelected
                    ? Border.all(color: Colors.blue, width: 2)
                    : null,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ]
                    : [],
              ),
              child: Text(
                discount,
                style: TextStyle(
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
