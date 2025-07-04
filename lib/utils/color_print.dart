import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';

void printWhite(dynamic text) => Platform.isIOS ? log(text.toString()) : debugPrint('\x1B[97m${text.toString()}\x1B[0m');