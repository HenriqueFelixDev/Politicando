import 'dart:io';

import 'package:flutter/material.dart';

import './app/app_widget.dart';

import './app/core/models/http/custom_http_overrides.dart';

void main() {
  // Para evitar o bloqueio por causa de certificado SSL inválido
  HttpOverrides.global = CustomHttpOverrides();
  runApp(const AppWidget());
}