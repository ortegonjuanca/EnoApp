import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get codigo_lenguaje => 'en';

  @override
  String get appbar_menu => 'Main Menu';

  @override
  String get tooltip_menu_navegacion => 'Navigation Menu';

  @override
  String get tooltip_ajustes => 'Settings';

  @override
  String get snackbar_cerrar => 'Close';

  @override
  String get cancelar => 'Cancel';

  @override
  String get aceptar => 'Confirm';

  @override
  String get tooltip_eliminar_calculo => 'Remove Calculation';

  @override
  String get tooltip_nuevo_calculo => 'New Calculation';

  @override
  String get tooltip_editar_calculo => 'Edit Calculation';

  @override
  String get tooltip_guardar_calculo => 'Save Calculation';

  @override
  String get calcular => 'Calculate';

  @override
  String get guardar => 'Save';

  @override
  String get titulo => 'Title';

  @override
  String get fecha => 'Date';

  @override
  String get observaciones => 'Notes';

  @override
  String get fortificar_vino => 'Fortify Wine';

  @override
  String get hidratar_vinagre => 'Hydrate Vinegar';

  @override
  String get historial_fortificaciones => 'Historical Fortifications';

  @override
  String get historial_hidrataciones => 'Historical Hydrations';

  @override
  String get volumen_vino_alcoholizar => 'Volume of wine to be fortified (liters)';

  @override
  String get grado_vino => 'Alcoholic strength of the wine to be fortified (% Vol)';

  @override
  String get grado_deseado => 'Alcoholic strength of the wine desired (% Vol)';

  @override
  String get grado_alcohol_dispone => 'Alcoholic strength available (% Vol)';

  @override
  String get volumen_alcohol_necesario => 'Volume of alcohol required (liters)';

  @override
  String get datos_fortificacion => 'Fortification Data';

  @override
  String get calculo_anadido_bbdd => 'The calculation has been added to the database correctly';

  @override
  String get fortificacion_error1 => 'The value of the volume of wine to be fortified is required';

  @override
  String get fortificacion_error2 => 'The value of alcoholic strength of the wine to be fortified is required.';

  @override
  String get fortificacion_error3 => 'The value of the desired alcoholic strength of the wine is required';

  @override
  String get fortificacion_error4 => 'The value of the alcoholic strength available is required';

  @override
  String get fortificacion_error5 => 'The value of the volume of wine to be fortified must be a whole number greater than 0';

  @override
  String fortificacion_error6(String decimal_grado_vino_deseado) {
    return 'You already have the wine at $decimal_grado_vino_deseadoº GL. Do not add anything';
  }

  @override
  String get fortificacion_error7 => 'The desired alcoholic strength may not be less than the alcoholic strength of the wine to be fortified';

  @override
  String get fortificacion_error8 => 'The strength of the alcohol available may not be less than or equal to the desired alcoholic strength';

  @override
  String get introduce_datos => 'ENTER THE FOLLOWING DATA';

  @override
  String get titulo_requerido => 'Title is required';

  @override
  String get fortificacion_existente => 'A fortification with that title already exists';

  @override
  String calculo_eliminado_bbdd(String title) {
    return '\'$title\' has been correctly removed';
  }

  @override
  String get no_observaciones => 'No notes provided';

  @override
  String get editado_correctamente => 'It has been correctly edited';

  @override
  String get tooltip_eliminar_fortificacion => 'Remove Fortification';

  @override
  String get tooltip_editar_fortificacion => 'Edit Fortification';

  @override
  String get volumen_vinagre_hidratar => 'Volume of vinegar to be hydrated (liters)';

  @override
  String get grado_vinagre => 'Degree of vinegar to be hydrated (% Vol)';

  @override
  String get grado_vinagre_deseado => 'Desired vinegar degree (% Vol)';

  @override
  String get volumen_agua_necesaria => 'Volume of water to be added (liters)';

  @override
  String get datos_hidratacion => 'Hydratation Data';

  @override
  String get hidratacion_error1 => 'The value of the volume of vinegar to be hydrated is required';

  @override
  String get hidratacion_error2 => 'The value of the degree of vinegar to be hydrated is required';

  @override
  String get hidratacion_error3 => 'The value of the desired vinegar degree is required';

  @override
  String get hidratacion_error4 => 'The value of the volume of vinegar to be hydrated must be a whole number greater than 0';

  @override
  String get hidratacion_error5 => 'The desired vinegar acetic strength value must be a whole number greater than 0';

  @override
  String hidratacion_error6(String decimal_grado_vinagre_deseado) {
    return 'You already have the vinegar at $decimal_grado_vinagre_deseadoº. Do not add anything';
  }

  @override
  String get hidratacion_error7 => 'The desired acetic strength must not be higher than the degree of the vinegar to be hydrated';

  @override
  String get hidratacion_existente => 'A hydratation with that title already exists';

  @override
  String get tooltip_eliminar_hidratacion => 'Remove Hydratation';

  @override
  String get tooltip_editar_hidratacion => 'Edit Hydratation';

  @override
  String seguro_eliminar(String title) {
    return 'Are you sure you want to delete \'$title\'?';
  }

  @override
  String get accion_irreversible => 'This action is irreversible';
}
