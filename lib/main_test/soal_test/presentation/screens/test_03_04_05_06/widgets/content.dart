part of '../test_03_request_url.dart';

class _Content extends StatelessWidget {
  final List<PostModel> posts;
  final bool showUserId;
  const _Content({required this.posts, required this.showUserId});

  Future<bool> _showDialog(BuildContext context, int postId) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 60,
            ),
            title: const Text(
              "Delete Data?",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF262626),
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              "Are you sure want to delete this data with ID $postId?",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {
                print('Button clicked!');
                context.read<JsonPlaceholderScreenCubit>().hideUserId();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[200],
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
              child: Text(
                "Delete Key User ID",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateColor.resolveWith(
                  (states) => Colors.teal[200]!,
                ),
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1,
                  borderRadius: BorderRadius.circular(8),
                ),
                columnSpacing: 24,
                columns: [
                  DataColumn(
                    label: Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (showUserId)
                    DataColumn(
                      label: Text(
                        'User ID',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  DataColumn(
                    label: Text(
                      'Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Body',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Action',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: posts
                    .map(
                      (post) => DataRow(
                        cells: [
                          DataCell(Text(post.id.toString())),
                          if (showUserId)
                            DataCell(Text(post.userId.toString())),
                          DataCell(
                            SizedBox(
                              width: 380,
                              child: Text(
                                post.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 400,
                              child: Text(
                                post.body,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          DataCell(
                            GestureDetector(
                              onTap: () async {
                                final confirmed = await _showDialog(
                                  context,
                                  post.id,
                                );
                                if (confirmed) {
                                  if (context.mounted) {
                                    context
                                        .read<JsonPlaceholderScreenCubit>()
                                        .deletePost(post.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Data dengan ID ${post.id} berhasil dihapus",
                                        ),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.red[300],
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.red[300],
                                  decorationThickness: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
