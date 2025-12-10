part of '../test_03_request_url.dart';

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.grey.shade200,
                  ),
                  border: TableBorder.all(
                    color: Colors.grey.shade400,
                    width: 1,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  columnSpacing: 24,
                  columns: List.generate(
                    4,
                    (_) => DataColumn(
                      label: Container(
                        width: 80,
                        height: 16,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  rows: List.generate(
                    10,
                    (_) => DataRow(
                      cells: [
                        DataCell(
                          Container(width: 40, height: 16, color: Colors.white),
                        ),
                        DataCell(
                          Container(width: 60, height: 16, color: Colors.white),
                        ),
                        DataCell(
                          SizedBox(
                            width: 380,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 14,
                                  width: 320,
                                  color: Colors.white,
                                  margin: EdgeInsets.only(bottom: 6),
                                ),
                                Container(
                                  height: 14,
                                  width: 280,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                4,
                                (_) => Container(
                                  height: 12,
                                  width: 300,
                                  color: Colors.white,
                                  margin: EdgeInsets.only(bottom: 6),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
