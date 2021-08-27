
class Hidr {
  String title;
  String date;
  String note;

  String volumen_vinagre_hidratar;
  String grado_vinagre;
  String grado_deseado;
  String volumen_agua_necesaria;

  Hidr({this.title, this.date, this.note, this.volumen_vinagre_hidratar, this.grado_vinagre, this.grado_deseado, this.volumen_agua_necesaria});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'note': note,
      'volumen_vinagre_hidratar': volumen_vinagre_hidratar,
      'grado_vinagre': grado_vinagre,
      'grado_deseado': grado_deseado,
      'volumen_agua_necesaria': volumen_agua_necesaria,
    };
  }

  // Implementa toString para que sea más fácil ver información sobre cada perro
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'Fort{title: $title, date: $date, note: $note, volumen_vinagre_hidratar: $volumen_vinagre_hidratar, grado_vinagre: $grado_vinagre, grado_deseado: $grado_deseado, volumen_agua_necesaria: $volumen_agua_necesaria}';
  }
}