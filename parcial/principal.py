from archivo import*
from catalogo import*

def menu():
    lista_catalogo_inicial(catalogo)
    while True:
        print("\n- Sistema de Facturación Electrónica ")
        print("1. Ver catálogo de productos")
        print("2. Registrar una venta")
        print("3. Agregar un nuevo producto")
        print("4. Salir")
        opcion = input("Seleccione una opción: ")
        if opcion == "1":
            lista_de_productos(catalogo)
        elif opcion == "2":
            gestionar_venta(catalogo)
        elif opcion == "3":
            agregar_producto(catalogo)
        elif opcion == "4":
            print("Gracias por usar el sistema. ¡Hasta luego!")
            break
        else:
            print("Opción no válida. Intente nuevamente.")

def gestionar_venta(catalogo):
    factura = Factura()
    while True:
        lista_de_productos(catalogo)
        codigo = input("\nIngrese el código del producto (o 'fin' para terminar): ")
        if codigo == 'fin':
            break
        producto = buscar_producto_por_codigo(catalogo, codigo)
        if producto:
            try:
                cantidad = int(input(f"Ingrese la cantidad de '{producto.nombre}' a comprar: "))
                factura.agregar_item(producto, cantidad)
                print(f"Se agregó {cantidad} unidad(es) de '{producto.nombre}' a la factura.")
            except ValueError:
                print("Por favor, ingrese un número válido.")
        else:
            print("Producto no encontrado. Intente nuevamente.")
    
    factura.calcular_totales()
    factura.mostrar_factura()


if __name__ == "__main__":
    menu()