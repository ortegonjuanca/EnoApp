import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get language => 'Español';

  @override
  String get codigo_lenguaje => 'es';

  @override
  String get appbar_menu => 'Menú Principal';

  @override
  String get tooltip_menu_navegacion => 'Menú de Navegación';

  @override
  String get tooltip_ajustes => 'Ajustes';

  @override
  String get snackbar_cerrar => 'Cerrar';

  @override
  String get cancelar => 'Cancelar';

  @override
  String get aceptar => 'Aceptar';

  @override
  String get tooltip_eliminar_calculo => 'Eliminar Cálculo';

  @override
  String get tooltip_nuevo_calculo => 'Nuevo Cálculo';

  @override
  String get tooltip_editar_calculo => 'Editar Cálculo';

  @override
  String get tooltip_guardar_calculo => 'Guardar Cálculo';

  @override
  String get calcular => 'Calcular';

  @override
  String get guardar => 'Guardar';

  @override
  String get titulo => 'Título';

  @override
  String get fecha => 'Fecha';

  @override
  String get observaciones => 'Observaciones';

  @override
  String get fortificar_vino => 'Fortificar Vino';

  @override
  String get hidratar_vinagre => 'Hidratar Vinagre';

  @override
  String get historial_fortificaciones => 'Historial Fortificaciones';

  @override
  String get historial_hidrataciones => 'Historial Hidrataciones';

  @override
  String get volumen_vino_alcoholizar => 'Volumen de vino que se desea alcoholizar (litros)';

  @override
  String get grado_vino => 'Grado del vino a alcoholizar (% Vol)';

  @override
  String get grado_deseado => 'Grado del vino que se desea (% Vol)';

  @override
  String get grado_alcohol_dispone => 'Grado del alcohol del que se dispone (% Vol)';

  @override
  String get volumen_alcohol_necesario => 'Volumen de alcohol necesario (litros)';

  @override
  String get datos_fortificacion => 'Datos de la Fortificación';

  @override
  String get calculo_anadido_bbdd => 'El cálculo se ha añadido a la base de datos correctamente';

  @override
  String get fortificacion_error1 => 'El valor del volumen de vino a alcoholizar es requerido';

  @override
  String get fortificacion_error2 => 'El valor del grado del vino a alcoholizar es requerido';

  @override
  String get fortificacion_error3 => 'El valor del grado del vino que se desea es requerido';

  @override
  String get fortificacion_error4 => 'El valor del grado del alcohol del que se dispone es requerido';

  @override
  String get fortificacion_error5 => 'El valor del volumen de vino a alcoholizar debe ser un número entero mayor que 0';

  @override
  String fortificacion_error6(String decimal_grado_vino_deseado) {
    return 'Ya tiene el vino a $decimal_grado_vino_deseadoº GL. No debe añadir nada';
  }

  @override
  String get fortificacion_error7 => 'El grado alcohólico deseado no puede ser menor que el grado del vino a alcoholizar';

  @override
  String get fortificacion_error8 => 'El grado del alcohol del que se dispone no puede ser menor o igual que el grado alcohólico deseado';

  @override
  String get introduce_datos => 'INTRODUCE LOS SIGUIENTES DATOS';

  @override
  String get titulo_requerido => 'El título es requerido';

  @override
  String get fortificacion_existente => 'Ya existe una fortificación con ese título';

  @override
  String calculo_eliminado_bbdd(String title) {
    return '\'$title\' ha sido eliminado correctamente';
  }

  @override
  String get no_observaciones => 'No se han proporcionado observaciones';

  @override
  String get editado_correctamente => 'Se ha editado correctamente';

  @override
  String get tooltip_eliminar_fortificacion => 'Eliminar Fortificación';

  @override
  String get tooltip_editar_fortificacion => 'Editar Fortificación';

  @override
  String get volumen_vinagre_hidratar => 'Volumen de vinagre que se desea hidratar (litros)';

  @override
  String get grado_vinagre => 'Grado del vinagre a hidratar (% Vol)';

  @override
  String get grado_vinagre_deseado => 'Grado del vinagre que se desea (% Vol)';

  @override
  String get volumen_agua_necesaria => 'Volumen de agua a añadir (litros';

  @override
  String get datos_hidratacion => 'Datos de la Hidratación';

  @override
  String get hidratacion_error1 => 'El valor del volumen de vinagre a hidratar es requerido';

  @override
  String get hidratacion_error2 => 'El valor del grado del vinagre a hidratar es requerido';

  @override
  String get hidratacion_error3 => 'El valor del grado del vinagre que se desea es requerido';

  @override
  String get hidratacion_error4 => 'El valor del volumen de vinagre a hidratar debe ser un número entero mayor que 0';

  @override
  String get hidratacion_error5 => 'El valor del grado acético de vinagre deseado debe ser un número entero mayor que 0';

  @override
  String hidratacion_error6(String decimal_grado_vinagre_deseado) {
    return 'Ya tiene el vinagre a $decimal_grado_vinagre_deseadoº. No debe añadir nada';
  }

  @override
  String get hidratacion_error7 => 'El grado acético deseado no puede ser mayor que el grado del vinagre a hidratar';

  @override
  String get hidratacion_existente => 'Ya existe una hidratación con ese título';

  @override
  String get tooltip_eliminar_hidratacion => 'Eliminar Hidratación';

  @override
  String get tooltip_editar_hidratacion => 'Editar Hidratación';

  @override
  String seguro_eliminar(String title) {
    return '¿Estás seguro que desea eliminar \'$title\'?';
  }

  @override
  String get accion_irreversible => 'Esta acción es irreversible';
}
