import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VouchersTab extends StatefulWidget {
  const VouchersTab({super.key});

  @override
  State<VouchersTab> createState() => _VouchersTabState();
}

class _VouchersTabState extends State<VouchersTab> {
  int selected = 0;
  final List<String> tabs = ["Current", "Used", "Expired"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 233, 233),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: Alignment(-1 + (selected * 1.0), 0),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: FractionallySizedBox(
                    widthFactor: 1 / tabs.length,
                    heightFactor: 1,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 249, 178, 51),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selected == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            tabs[index],
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Builder(
            builder: (_) {
              if (selected == 0) {
                return _buildVouchersList("Current");
              } else if (selected == 1) {
                return _buildVouchersList("Used");
              } else {
                return _buildVouchersList("Expired");
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildVouchersList(String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(3, (index) {
          return Container(
            height: 90,
            margin: const EdgeInsets.only(bottom: 16),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/voucher.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    padding:
                        const EdgeInsets.only(right: 50, left: 90, top: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$type Voucher #${index + 1}",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            // const SizedBox(width: 4),
                            Text(
                              "12 July 2022",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 16), // 👈 Add this

                        Text(
                          "\$${(index + 1) * 100}",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
