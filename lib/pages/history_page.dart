import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mathtool/constants/colors.dart';
import 'package:mathtool/constants/res.dart';
import 'package:mathtool/models/history_model.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  final List<HistoryItem> result = Hive.box<HistoryItem>('history').values.toList().reversed.toList().cast<HistoryItem>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        'History',
        Icons.auto_delete_outlined,
        () {
          Navigator.pop(context);
          Hive.box<HistoryItem>('history').clear();
          showToast(context, 'History cleared successfully');
        },
      ),
      body: result.isEmpty
          ? Center(
              child: Text(
                'Empty!',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12.0),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemCount: result.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tileColor: AppColors.primaryColor,
                  title: Text(
                    result[i].title,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                  subtitle: Text(
                    result[i].subtitle,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                );
              },
            ),
    );
  }
}
