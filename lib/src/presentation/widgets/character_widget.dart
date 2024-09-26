import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kdigital_test/src/data/models/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: Colors.black12,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Name: ${character.name}'),
                    Text('Status: ${character.status}'),
                    Text('Species: ${character.species}'),
                    Text('Gender: ${character.gender}'),
                    Text('Location: ${character.location.name}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}