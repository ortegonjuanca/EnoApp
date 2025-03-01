import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @codigo_lenguaje.
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get codigo_lenguaje;

  /// No description provided for @appbar_menu.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get appbar_menu;

  /// No description provided for @tooltip_menu_navegacion.
  ///
  /// In en, this message translates to:
  /// **'Navigation Menu'**
  String get tooltip_menu_navegacion;

  /// No description provided for @tooltip_ajustes.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tooltip_ajustes;

  /// No description provided for @snackbar_cerrar.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get snackbar_cerrar;

  /// No description provided for @cancelar.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelar;

  /// No description provided for @aceptar.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get aceptar;

  /// No description provided for @tooltip_eliminar_calculo.
  ///
  /// In en, this message translates to:
  /// **'Remove Calculation'**
  String get tooltip_eliminar_calculo;

  /// No description provided for @tooltip_nuevo_calculo.
  ///
  /// In en, this message translates to:
  /// **'New Calculation'**
  String get tooltip_nuevo_calculo;

  /// No description provided for @tooltip_editar_calculo.
  ///
  /// In en, this message translates to:
  /// **'Edit Calculation'**
  String get tooltip_editar_calculo;

  /// No description provided for @tooltip_guardar_calculo.
  ///
  /// In en, this message translates to:
  /// **'Save Calculation'**
  String get tooltip_guardar_calculo;

  /// No description provided for @calcular.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calcular;

  /// No description provided for @guardar.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get guardar;

  /// No description provided for @titulo.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titulo;

  /// No description provided for @fecha.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get fecha;

  /// No description provided for @observaciones.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get observaciones;

  /// No description provided for @fortificar_vino.
  ///
  /// In en, this message translates to:
  /// **'Fortify Wine'**
  String get fortificar_vino;

  /// No description provided for @hidratar_vinagre.
  ///
  /// In en, this message translates to:
  /// **'Hydrate Vinegar'**
  String get hidratar_vinagre;

  /// No description provided for @historial_fortificaciones.
  ///
  /// In en, this message translates to:
  /// **'Historical Fortifications'**
  String get historial_fortificaciones;

  /// No description provided for @historial_hidrataciones.
  ///
  /// In en, this message translates to:
  /// **'Historical Hydrations'**
  String get historial_hidrataciones;

  /// No description provided for @volumen_vino_alcoholizar.
  ///
  /// In en, this message translates to:
  /// **'Volume of wine to be fortified (liters)'**
  String get volumen_vino_alcoholizar;

  /// No description provided for @grado_vino.
  ///
  /// In en, this message translates to:
  /// **'Alcoholic strength of the wine to be fortified (% Vol)'**
  String get grado_vino;

  /// No description provided for @grado_deseado.
  ///
  /// In en, this message translates to:
  /// **'Alcoholic strength of the wine desired (% Vol)'**
  String get grado_deseado;

  /// No description provided for @grado_alcohol_dispone.
  ///
  /// In en, this message translates to:
  /// **'Alcoholic strength available (% Vol)'**
  String get grado_alcohol_dispone;

  /// No description provided for @volumen_alcohol_necesario.
  ///
  /// In en, this message translates to:
  /// **'Volume of alcohol required (liters)'**
  String get volumen_alcohol_necesario;

  /// No description provided for @datos_fortificacion.
  ///
  /// In en, this message translates to:
  /// **'Fortification Data'**
  String get datos_fortificacion;

  /// No description provided for @calculo_anadido_bbdd.
  ///
  /// In en, this message translates to:
  /// **'The calculation has been added to the database correctly'**
  String get calculo_anadido_bbdd;

  /// No description provided for @fortificacion_error1.
  ///
  /// In en, this message translates to:
  /// **'The value of the volume of wine to be fortified is required'**
  String get fortificacion_error1;

  /// No description provided for @fortificacion_error2.
  ///
  /// In en, this message translates to:
  /// **'The value of alcoholic strength of the wine to be fortified is required.'**
  String get fortificacion_error2;

  /// No description provided for @fortificacion_error3.
  ///
  /// In en, this message translates to:
  /// **'The value of the desired alcoholic strength of the wine is required'**
  String get fortificacion_error3;

  /// No description provided for @fortificacion_error4.
  ///
  /// In en, this message translates to:
  /// **'The value of the alcoholic strength available is required'**
  String get fortificacion_error4;

  /// No description provided for @fortificacion_error5.
  ///
  /// In en, this message translates to:
  /// **'The value of the volume of wine to be fortified must be a whole number greater than 0'**
  String get fortificacion_error5;

  /// No description provided for @fortificacion_error6.
  ///
  /// In en, this message translates to:
  /// **'You already have the wine at {decimal_grado_vino_deseado}º GL. Do not add anything'**
  String fortificacion_error6(String decimal_grado_vino_deseado);

  /// No description provided for @fortificacion_error7.
  ///
  /// In en, this message translates to:
  /// **'The desired alcoholic strength may not be less than the alcoholic strength of the wine to be fortified'**
  String get fortificacion_error7;

  /// No description provided for @fortificacion_error8.
  ///
  /// In en, this message translates to:
  /// **'The strength of the alcohol available may not be less than or equal to the desired alcoholic strength'**
  String get fortificacion_error8;

  /// No description provided for @introduce_datos.
  ///
  /// In en, this message translates to:
  /// **'ENTER THE FOLLOWING DATA'**
  String get introduce_datos;

  /// No description provided for @titulo_requerido.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get titulo_requerido;

  /// No description provided for @fortificacion_existente.
  ///
  /// In en, this message translates to:
  /// **'A fortification with that title already exists'**
  String get fortificacion_existente;

  /// No description provided for @calculo_eliminado_bbdd.
  ///
  /// In en, this message translates to:
  /// **'\'{title}\' has been correctly removed'**
  String calculo_eliminado_bbdd(String title);

  /// No description provided for @no_observaciones.
  ///
  /// In en, this message translates to:
  /// **'No notes provided'**
  String get no_observaciones;

  /// No description provided for @editado_correctamente.
  ///
  /// In en, this message translates to:
  /// **'It has been correctly edited'**
  String get editado_correctamente;

  /// No description provided for @tooltip_eliminar_fortificacion.
  ///
  /// In en, this message translates to:
  /// **'Remove Fortification'**
  String get tooltip_eliminar_fortificacion;

  /// No description provided for @tooltip_editar_fortificacion.
  ///
  /// In en, this message translates to:
  /// **'Edit Fortification'**
  String get tooltip_editar_fortificacion;

  /// No description provided for @volumen_vinagre_hidratar.
  ///
  /// In en, this message translates to:
  /// **'Volume of vinegar to be hydrated (liters)'**
  String get volumen_vinagre_hidratar;

  /// No description provided for @grado_vinagre.
  ///
  /// In en, this message translates to:
  /// **'Degree of vinegar to be hydrated (% Vol)'**
  String get grado_vinagre;

  /// No description provided for @grado_vinagre_deseado.
  ///
  /// In en, this message translates to:
  /// **'Desired vinegar degree (% Vol)'**
  String get grado_vinagre_deseado;

  /// No description provided for @volumen_agua_necesaria.
  ///
  /// In en, this message translates to:
  /// **'Volume of water to be added (liters)'**
  String get volumen_agua_necesaria;

  /// No description provided for @datos_hidratacion.
  ///
  /// In en, this message translates to:
  /// **'Hydratation Data'**
  String get datos_hidratacion;

  /// No description provided for @hidratacion_error1.
  ///
  /// In en, this message translates to:
  /// **'The value of the volume of vinegar to be hydrated is required'**
  String get hidratacion_error1;

  /// No description provided for @hidratacion_error2.
  ///
  /// In en, this message translates to:
  /// **'The value of the degree of vinegar to be hydrated is required'**
  String get hidratacion_error2;

  /// No description provided for @hidratacion_error3.
  ///
  /// In en, this message translates to:
  /// **'The value of the desired vinegar degree is required'**
  String get hidratacion_error3;

  /// No description provided for @hidratacion_error4.
  ///
  /// In en, this message translates to:
  /// **'The value of the volume of vinegar to be hydrated must be a whole number greater than 0'**
  String get hidratacion_error4;

  /// No description provided for @hidratacion_error5.
  ///
  /// In en, this message translates to:
  /// **'The desired vinegar acetic strength value must be a whole number greater than 0'**
  String get hidratacion_error5;

  /// No description provided for @hidratacion_error6.
  ///
  /// In en, this message translates to:
  /// **'You already have the vinegar at {decimal_grado_vinagre_deseado}º. Do not add anything'**
  String hidratacion_error6(String decimal_grado_vinagre_deseado);

  /// No description provided for @hidratacion_error7.
  ///
  /// In en, this message translates to:
  /// **'The desired acetic strength must not be higher than the degree of the vinegar to be hydrated'**
  String get hidratacion_error7;

  /// No description provided for @hidratacion_existente.
  ///
  /// In en, this message translates to:
  /// **'A hydratation with that title already exists'**
  String get hidratacion_existente;

  /// No description provided for @tooltip_eliminar_hidratacion.
  ///
  /// In en, this message translates to:
  /// **'Remove Hydratation'**
  String get tooltip_eliminar_hidratacion;

  /// No description provided for @tooltip_editar_hidratacion.
  ///
  /// In en, this message translates to:
  /// **'Edit Hydratation'**
  String get tooltip_editar_hidratacion;

  /// No description provided for @seguro_eliminar.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \'{title}\'?'**
  String seguro_eliminar(String title);

  /// No description provided for @accion_irreversible.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible'**
  String get accion_irreversible;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
