import 'package:flutter/material.dart';
import 'package:proxima/ui/utils.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<StatefulWidget> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Playing from Album/Playlist")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage( "assets/cover-example.jpg")
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Song title", style: TextStyle(fontSize: 24)),
                    Text("Author"),
                  ],
                ),
              ),
            ],
          ),
          // Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => notImplemented(context),
                  icon: Icon(Icons.fast_rewind),
                ),
                Expanded(child: LinearProgressIndicator(value: 0.5)),
                IconButton(
                  onPressed: () => notImplemented(context),
                  icon: Icon(Icons.fast_forward),
                ),
              ],
            ),
          ),
          // Player controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Shuffle
              IconButton(
                onPressed: () => notImplemented(context),
                icon: Icon(Icons.shuffle),
              ),
              // Skip previous
              IconButton.filledTonal(
                onPressed: () => notImplemented(context),
                icon: Icon(Icons.skip_previous),
              ),
              // Play/Pause
              IconButton.filledTonal(
                onPressed: () => notImplemented(context),
                icon: Icon(Icons.pause),
                iconSize: IconTheme.of(context).size! * 2.0,
              ),
              // Skip next
              IconButton.filledTonal(
                onPressed: () => notImplemented(context),
                icon: Icon(Icons.skip_next),
              ),
              // Favourite
              IconButton(
                onPressed: () => notImplemented(context),
                icon: Icon(Icons.favorite_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
