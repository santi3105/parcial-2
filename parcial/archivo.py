class Factura:
    def __init__(self):
        self.items = []
        self.subtotal = 0
        self.iva = 0
        self.total = 0

    def agregar_item(self, producto, cantidad):
        subtotal_producto = producto.precio * cantidad
        self.items.append({"producto": producto, "cantidad": cantidad, "subtotal": subtotal_producto})
        self.subtotal += subtotal_producto

    def calcular_totales(self):
        self.iva = self.subtotal * 0.19 
        self.total = self.subtotal + self.iva

    def mostrar_factura(self):
        print("\n- Detalle de Factura ")
        for item in self.items:
            p = item["producto"]
            print(f"{p.nombre} x {item['cantidad']} - Subtotal: ${item['subtotal']}")
        print(f"Subtotal: ${self.subtotal}")
        print(f"IVA (19%): ${self.iva}")
        print(f"Total: ${self.total}")