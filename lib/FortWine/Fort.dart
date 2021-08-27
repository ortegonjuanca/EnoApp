
class Fort {
  String title;
  String date;
  String note;

  String volumen_vino_alcoholizar;
  String grado_vino;
  String grado_deseado;
  String grado_alcohol_dispone;
  String volumen_alcohol_necesario;

  Fort({this.title, this.date, this.note, this.volumen_vino_alcoholizar, this.grado_vino, this.grado_deseado, this.grado_alcohol_dispone, this.volumen_alcohol_necesario});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'note': note,
      'volumen_vino_alcoholizar': volumen_vino_alcoholizar,
      'grado_vino': grado_vino,
      'grado_deseado': grado_deseado,
      'grado_alcohol_dispone': grado_alcohol_dispone,
      'volumen_alcohol_necesario': volumen_alcohol_necesario,
    };
  }

  // Implementa toString para que sea más fácil ver información sobre cada perro
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'Fort{title: $title, date: $date, note: $note, volumen_vino_alcoholizar: $volumen_vino_alcoholizar, grado_vino: $grado_vino, grado_deseado: $grado_deseado, grado_alcohol_dispone: $grado_alcohol_dispone, volumen_alcohol_necesario: $volumen_alcohol_necesario}';
  }
}