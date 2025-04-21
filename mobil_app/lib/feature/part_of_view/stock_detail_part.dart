part of '../view/stock_detail_view.dart';

class _StockInfoCard extends StatelessWidget {
  final StockDetailModel item;

  const _StockInfoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            buildInfoRow(
              Icons.info,
              ProjectItemsString.symbol,
              item.symbol ?? ProjectItemsString.none,
            ),
            buildInfoRow(
              Icons.business,
              ProjectItemsString.company,
              item.companyName ?? ProjectItemsString.none,
            ),
            buildInfoRow(
              Icons.price_check,
              ProjectItemsString.purchase,
              "${item.purchase?.toStringAsFixed(2) ?? ProjectItemsString.none} \$",
            ),
            buildInfoRow(
              Icons.category,
              ProjectItemsString.industry,
              item.industry ?? ProjectItemsString.none,
            ),
            buildInfoRow(
              Icons.trending_up,
              ProjectItemsString.marketCap,
              "${item.marketCap ?? 0}",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

/// Comment Widgets
///
///
class _CommentTile extends StatelessWidget {
  final String title;
  final String username;
  final String content;
  final String date;

  const _CommentTile({
    required this.title,
    required this.username,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/png/logo.png'),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username),
          const SizedBox(height: 4),
          Text(content),
          const SizedBox(height: 4),
          Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          const Row(
            children: [
              Icon(Icons.thumb_up, size: 16, color: Colors.grey),
              SizedBox(width: 8),
              Icon(Icons.reply, size: 16, color: Colors.grey),
            ],
          )
        ],
      ),
    );
  }
}

class _CommentForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController commentController;
  final VoidCallback onSubmit;

  const _CommentForm({
    required this.formKey,
    required this.titleController,
    required this.commentController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: ProjectItemsString.commentTitle,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: commentController,
                  decoration: const InputDecoration(
                    labelText: ProjectItemsString.commentContent,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ProjectItemsString.commentEmptyError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text(ProjectItemsString.sendButton),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Buttons
///
///
class _CommentActionButtons extends StatelessWidget {
  final VoidCallback onToggleCommentForm;

  const _CommentActionButtons({required this.onToggleCommentForm});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              NavigatorHelper.navigateToPage(context, AppRoute.payment);
            },
            child: const Text(ProjectItemsString.buyButton),
          ),
          ElevatedButton(
            onPressed: onToggleCommentForm,
            child: const Text(ProjectItemsString.commentButton),
          )
        ],
      ),
    );
  }
}
