# Paquete Fake API Store Etapa 3

Este paquete proporciona modelos de datos y servicios para interactuar con una API falsa de tienda. Está diseñado para ser utilizado en aplicaciones Flutter.

## Características

- Modelos de datos para  productos, usuarios y carritos.
- Servicios para obtener los datos de la API.

## Instalación

Agrega esta línea a tu archivo `pubspec.yaml` en la sección de dependencias:

```yaml
dependencies:
  paquete_fake_api_store_etapa_3:
    git:
      url: https://github.com/tu_usuario/paquete_fake_api_store_etapa_3.git
      ref: main
```

Luego, ejecuta:

```
flutter pub get
```

## Uso
Importa el paquete en tu archivo Dart:

```dart
import 'package:paquete_fake_api_store_etapa_3/paquete_fake_api_store_etapa_3.dart';
```

## Ejemplo de Uso
A continuación, se muestra un ejemplo de cómo consumir el servicio para obtener productos, usuarios y carritos:

```dart
import 'package:paquete_fake_api_store_etapa_3/src/paquete_fake_api_store_etapa_3_base.dart';

void main() async {
  // Obtener productos
  List<ProductModel> productos = await fetchProducts();
  print('Productos: $productos');

  // Obtener usuarios
  List<UserModel> usuarios = await fetchUsers();
  print('Usuarios: $usuarios');

  // Obtener carritos
  List<CartModel> carritos = await fetchCarts();
  print('Carritos: $carritos');
}
```

### Respuesta Esperada
La respuesta esperada de cada servicio es una lista de modelos correspondientes:

- Productos: Lista de ProductModel con propiedades como title, price, rating, etc.
- Usuarios: Lista de UserModel con propiedades como name, email, etc.
- Carritos: Lista de CartM