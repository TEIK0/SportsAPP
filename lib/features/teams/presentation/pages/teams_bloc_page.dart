import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sports_app/features/teams/presentation/bloc/teams_bloc.dart';
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
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedTeamsList) {
              return Scaffold(
                appBar: searchBar(context),
                body: ListView.builder(
                  itemCount: state.teams.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 249, 249, 249),
                          border: Border(bottom: BorderSide(width: 3))),
                      child: ListTile(
                          minVerticalPadding: 15,
                          title: Text(state.teams.data[index].name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 1, 1, 1))),
                          onTap: () => {
                                getPlayertStats(
                                    context, state.teams.data[index])
                              }),
                    );
                  },
                ),
              );
            } else if (state is LoadedTeamInfo) {
              return Scaffold(appBar: searchBar(context), body: Center());
            } else {
              return const Text('Fatal error');
            }
          },
        ),
      ),
    );
  }

  AppBar searchBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(
        color: Colors.white,
        width: 300,
        height: 50,
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            input = value;
          },
          onSubmitted: (_) {
            getPlayerstList(context, input);
          },
          cursorColor: Colors.black,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }

  void getPlayerstList(BuildContext context, String name) {
    BlocProvider.of<TeamsBloc>(context).add(GetTeamsListEvent(name));
  }

  void getPlayertStats(BuildContext context, Datum data) {
    BlocProvider.of<TeamsBloc>(context).add(ShowTeamInfoEvent(data));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Sports App',
          style: TextStyle(color: Colors.black, fontSize: 40),
        ));
  }
}
