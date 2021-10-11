import 'dart:convert';

List<ListadoAux> listadoAuxFromJson(String str) => List<ListadoAux>.from(json.decode(str).map((x) => ListadoAux.fromJson(x)));

String listadoAuxToJson(List<ListadoAux> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListadoAux {
  ListadoAux({
      this.nombre,
      this.duracion,
      this.promedio,
      this.lugar,
      this.id,
      this.responsable,
      this.area,
      this.descripcion,
      this.status,
  });

  String nombre;
  String duracion;
  double promedio;
  String lugar;
  int id;
  String responsable;
  String area;
  String descripcion;
  int status;

  factory ListadoAux.fromJson(Map<String, dynamic> json) => ListadoAux(
      nombre: json["nombre"],
      duracion: json["duracion"],
      promedio: json["promedio"].toDouble(),
      lugar: json["lugar"],
      id: json["id"],
      responsable: json["responsable"],
      descripcion: json["descripcion"],
      status: json["status"],
      area: json["area"]
  );

  Map<String, dynamic> toJson() => {
      "nombre": nombre,
      "duracion": duracion,
      "promedio": promedio,
      "lugar": lugar,
      "id": id,
      "responsable": responsable,
      "descripcion": descripcion,
      "status": status,
  };
}
