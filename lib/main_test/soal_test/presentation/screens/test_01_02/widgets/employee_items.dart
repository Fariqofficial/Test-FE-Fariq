part of '../test_02_show_json_data.dart';

class _EmployeeItems extends StatelessWidget {
  final Map<String, dynamic> employee;
  final int index;
  final int total;
  const _EmployeeItems({
    super.key,
    required this.employee,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    employee['fullname'][0],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF262626),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee['fullname'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF262626),
                    ),
                  ),
                  Text(
                    employee['position'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF262626),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.business_outlined,
                        size: 10,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4),
                      Text(
                        employee['department'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF262626),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "|",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF262626),
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.person, size: 10, color: Colors.black),
                      SizedBox(width: 4),
                      Text(
                        '${employee['age']} years old',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF262626),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
