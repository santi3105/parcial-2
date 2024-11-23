from producto import*

catalogo = {
    "Linea Blanca": [],
    "Pequeños Electrodomesticos": [],
    "Entretenimiento": [],
    "Aires Acondicionados": []
}

def agregar_producto(catalogo):
    print("\n- Agregar Producto ")
    categoria = input("Ingrese la categoría (Linea Blanca, Pequeños Electrodomesticos, Entretenimiento, Aires Acondicionados): ")
    if categoria not in catalogo:
        print("Categoría no válida.")
        return 
    elif categoria in catalogo:
        codigo = input("Ingrese el código único del producto: ")
        nombre = input("Ingrese el nombre del producto: ")
    try:
        precio = float(input("Ingrese el precio del producto: "))
        producto = Producto(codigo, nombre, precio, categoria)
        catalogo[categoria].append(producto)
        print(f"El producto {nombre} fue agregado exitosamente.")
    except ValueError:
        print("El precio debe ser un número válido.")

def lista_de_productos(catalogo):
    print("\n- Catálogo de Productos ")
    for categoria, productos in catalogo.items():
        print(f"\nCategoría: {categoria}")
        for producto in productos:
            print(f"Codigo: {producto.codigo}, Nombre: {producto.nombre}, Precio: ${producto.precio}")

def buscar_producto_por_codigo(catalogo, codigo):
    for productos in catalogo.values():
        for producto in productos:
            if producto.codigo == codigo:
                return producto
    return None

def lista_catalogo_inicial(catalogo):
    catalogo["Linea Blanca"].append(Producto("LB001", "Refrigerador", 1500000, "Linea Blanca"))
    catalogo["Linea Blanca"].append(Producto("LB002", "Lavadora", 2000000, "Linea Blanca"))
    catalogo["Linea Blanca"].append(Producto("LB003", "secadora", 2000000, "Linea Blanca"))
    catalogo["Pequeños Electrodomesticos"].append(Producto("PE001", "Licuadora", 100000, "Pequeños Electrodomesticos"))
    catalogo["Pequeños Electrodomesticos"].append(Producto("PE002", "Cafetera", 80000, "Pequeños Electrodomesticos"))
    catalogo["Pequeños Electrodomesticos"].append(Producto("PE002", "Tostadora", 70000, "Pequeños Electrodomesticos"))
    catalogo["Entretenimiento"].append(Producto("EN001", "Televisor", 6000000, "Entretenimiento"))
    catalogo["Entretenimiento"].append(Producto("EN002", "Sistema de Sonido", 4000000, "Entretenimiento"))  
    catalogo["Aires Acondicionados"].append(Producto("AC001", "Equipos de climatizacion", 1500000, "Aires Acondicionados"))



