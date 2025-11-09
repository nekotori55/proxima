
import 'package:flutter/material.dart';

void notImplemented(BuildContext context)
{
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Not implemented!")),
  );
}