import 'package:flutter/material.dart';

// TODO: Further refactor and document code

/// Tile for StronkToggleButtons
class StronkToggleButtonTile {
  StronkToggleButtonTile({this.icon, this.label});

  final IconData icon;
  final String label;
}

/// Set of toggle buttons
///
/// Display row of buttons according to given list of tiles
///
/// Only one button can be selected at a time
class StronkToggleButtons extends StatefulWidget {
  const StronkToggleButtons({
    Key key,
    this.tiles,
  }) : super(key: key);
  final List<StronkToggleButtonTile> tiles;

  @override
  StronkToggleButtonsState createState() => StronkToggleButtonsState();
}

class StronkToggleButtonsState extends State<StronkToggleButtons> {
  final double iconSize = 40;
  final double iconPadding = 20;
  int selectedButton;
  List<StronkToggleButton> buttons = List<StronkToggleButton>();

  void initButtons() {
    buttons.clear();
    var tiles = widget.tiles;
    for (int i = 0; i < widget.tiles.length; i++) {
      StronkToggleButtonTile tile = tiles[i];
      buttons.add(
        StronkToggleButton(
          icon: tile.icon,
          label: tile.label,
          selected: i == selectedButton,
          onPressed: () {
            setState(() {
              selectedButton = i;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initButtons();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buttons,
    );
  }
}

/// Individual button for StronkToggleButtons
class StronkToggleButton extends StatelessWidget {
  const StronkToggleButton({
    Key key,
    this.iconPadding,
    this.iconSize,
    @required this.selected,
    @required this.icon,
    this.onPressed,
    this.label,
  }) : super(key: key);

  final double iconPadding;
  final double iconSize;
  final bool selected;
  final IconData icon;
  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all((iconPadding != null) ? iconPadding : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            iconSize: (iconSize != null) ? iconSize : 40,
            icon: Icon(
              icon,
              color: selected ? Theme.of(context).accentColor : Colors.black,
            ),
            onPressed: () => onPressed(),
          ),
          Text((label != null) ? label : ''),
        ],
      ),
    );
  }
}
