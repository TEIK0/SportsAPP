import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/features/players/presentation/pages/player_stats._page.dart';

import '../../../../core/widgets/botttom_bar.dart';
import '../../../../injections.dart';
import '../../data/models/player_model.dart';
import '../bloc/players_bloc.dart';

class PlayersBlocPage extends StatefulWidget {
  @override
  State<PlayersBlocPage> createState() => _PlayersBlocPageState();
}

class _PlayersBlocPageState extends State<PlayersBlocPage> {
  late String input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => sl<PlayersBloc>(),
        child: BlocBuilder<PlayersBloc, PlayersState>(
          builder: (context, state) {
            if (state is Empty) {
              return Scaffold(appBar: searchBar(context));
            } else if (state is Error) {
              return Scaffold(
                  appBar: searchBar(context),
                  body: Center(child: Text('Error')));
            } else if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedPlayersList) {
              return Scaffold(
                appBar: searchBar(context),
                body: ListView.builder(
                  itemCount: state.players.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 249, 249, 249),
                          border: Border(bottom: BorderSide(width: 3))),
                      child: ListTile(
                          minVerticalPadding: 15,
                          title: Text(state.players.data[index].name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 1, 1, 1))),
                          onTap: () => {
                                getPlayertStats(
                                    context, state.players.data[index])
                              }),
                    );
                  },
                ),
              );
            } else if (state is LoadedPlayerStats) {
              return Scaffold(
                  appBar: searchBar(context),
                  body: PlayerStatsPage(state: state.player));
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
    BlocProvider.of<PlayersBloc>(context).add(GetPlayersListEvent(name));
  }

  void getPlayertStats(BuildContext context, Datum data) {
    BlocProvider.of<PlayersBloc>(context).add(ShowPlayerStatsEvent(data));
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
