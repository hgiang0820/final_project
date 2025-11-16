import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String title;
  final String mainValue;
  final String mainLabel;
  final IconData icon;
  final Color iconColor;
  final List<Color> gradient;
  final VoidCallback onTap;

  const StatisticsCard({
    required this.title,
    required this.mainValue,
    required this.mainLabel,
    required this.icon,
    required this.iconColor,
    required this.gradient,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: gradient),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: iconColor.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(icon, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                mainValue,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: iconColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                mainLabel,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                // if (stats.isNotEmpty) ...[
                //   const SizedBox(height: 16),
                //   Container(
                //     padding: const EdgeInsets.all(12),
                //     decoration: BoxDecoration(
                //       color: Colors.grey[50],
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: stats((stat) {
                //         return Column(
                //           children: [
                //             Text(
                //               stat.value,
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.bold,
                //                 color: stat.color,
                //               ),
                //             ),
                //             const SizedBox(height: 4),
                //             Text(
                //               stat.label,
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 color: Colors.grey[600],
                //               ),
                //             ),
                //           ],
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _MiniStat {
//   final String label;
//   final String value;
//   final Color color;

//   _MiniStat(this.label, this.value, this.color);
// }
