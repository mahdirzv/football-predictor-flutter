import 'package:flutter/material.dart';

import '../home_data_models.dart';

class ExpandableList extends StatelessWidget {
  final Function(int index, bool isExpanded) onExpansionChanged;
  final CompetitionDataClass matchData;

  const ExpandableList({
    super.key,
    required this.matchData,
    required this.onExpansionChanged
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        onExpansionChanged(index, isExpanded);
      },
      children: matchData.schedule!.map<ExpansionPanel>((Schedule schedule) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(matchData.name!),
            );
          },
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: schedule.matches!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Match ${index + 1}: ${schedule.matches![index].homeTeam} vs ${schedule.matches![index].awayTeam}'),
                // Add more details about the match here
              );
            },
          ),
          isExpanded: true,
        );
      }).toList(),
    );
  }
}