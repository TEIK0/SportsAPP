import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sports_app/features/teams/presentation/bloc/teams_bloc.dart';
import 'package:sports_app/features/teams/presentation/pages/team_stats_page.dart';
import '../../../../core/pages/loading_page.dart';
import '../../data/models/teams_model.dart';

import '../../../../injections.dart';

class TeamsBlocPage extends StatefulWidget {
  @override
  State<TeamsBlocPage> createState() => _TeamsBlocPageState();
}

class _TeamsBlocPageState extends State<TeamsBlocPage> {
  late String input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl<TeamsBloc>(),
        child: BlocBuilder<TeamsBloc, TeamsState>(
          builder: (context, state) {
            if (state is Empty) {
              return Scaffold(appBar: searchBar(context));
            } else if (state is Error) {
              return Scaffold(
                  appBar: searchBar(context),
                  body: Center(child: Text('Error')));
            } else if (state is Loading) {
              return LoadingDisplay();
            } else if (state is LoadedTeamsList) {
              return teamsListWidget(context, state);
            } else if (state is LoadedTeamInfo) {
              return Scaffold(
                  appBar: searchBar(context),
                  body: TeamStatsPage(state: state.team));
            } else {
              return const Text('Fatal error');
            }
          },
        ),
      ),
    );
  }

  Scaffold teamsListWidget(BuildContext context, LoadedTeamsList state) {
    return Scaffold(
      appBar: searchBar(context),
      body: ListView.builder(
        itemCount: state.teams.data.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 28, 28, 26),
                border: Border(bottom: BorderSide(width: 3))),
            child: listTitleWidget(state, index, context),
          );
        },
      ),
    );
  }

  ListTile listTitleWidget(
      LoadedTeamsList state, int index, BuildContext context) {
    return ListTile(
        minVerticalPadding: 15,
        title: Text(state.teams.data[index].name,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        onTap: () => {getTeamStats(context, state.teams.data[index])});
  }

  AppBar searchBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      title: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(style: BorderStyle.solid, width: 3)),
        width: 300,
        height: 50,
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            input = value;
          },
          onSubmitted: (_) {
            getTeamstList(context, input);
          },
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }

  void getTeamstList(BuildContext context, String name) {
    BlocProvider.of<TeamsBloc>(context).add(GetTeamsListEvent(name));
  }

  void getTeamStats(BuildContext context, DatumTeams data) {
    BlocProvider.of<TeamsBloc>(context).add(ShowTeamInfoEvent(data));
  }
}
