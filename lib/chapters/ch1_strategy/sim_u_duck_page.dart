import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_card.dart';
import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_models/decoy_duck.dart';
import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_models/duck.dart';
import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_models/mallard_duck.dart';
import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_models/model_duck.dart';
import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_models/red_head_duck.dart';
import 'package:ch1_duck_behavior/chapters/ch1_strategy/duck_models/rubber_duck.dart';
import 'package:ch1_duck_behavior/constants/app_delegates.dart';
import 'package:ch1_duck_behavior/constants/app_edge_insets.dart';
import 'package:flutter/material.dart';

class SimUDuckPage extends StatefulWidget {
  static const String routeName = 'SimUDuckPage';
  final String title;

  SimUDuckPage({
    Key? key,
    this.title = 'Ch.1: SimUDuck (Стратегия)',
  }) : super(key: key);

  @override
  State<SimUDuckPage> createState() => _SimUDuckPageState();
}

class _SimUDuckPageState extends State<SimUDuckPage> {
  final List<Duck> ducks = [
    DecoyDuck(),
    MallardDuck(),
    ModelDuck(),
    RedHeadDuck(),
    RubberDuck(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: (MediaQuery.of(context).size.width >= 400)
          ? GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: AppDelegates.gridDelegate,
              itemCount: ducks.length,
              itemBuilder: (context, i) {
                final duck = ducks[i];
                return DuckCard(
                  duckModel: duck,
                  margin: EdgeInsets.zero,
                );
              })
          : ListView.builder(
              itemCount: ducks.length,
              itemBuilder: (context, i) {
                final duck = ducks[i];
                return DuckCard(
                  duckModel: duck,
                  margin: i == ducks.length - 1
                      ? AppEdgeInsets.t15h20b60
                      : AppEdgeInsets.t15h20,
                );
              },
            ),
    );
  }
}
