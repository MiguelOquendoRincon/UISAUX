import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.usuario,
        this.phone,
        this.password,
        this.nombre,
        this.apellido,
        this.id,
        this.rol,
    });

    String usuario;
    String password;
    String nombre;
    String apellido;
    String phone;
    int id;
    String rol;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuario: json["usuario"],
        password: json["password"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        phone: json["phone"],
        id: json["id"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "id": id,
        "rol": rol,
    };
}