algoritmo sin_titulo
	Dimension codigos[10], nombres[10], precios[10], categorias[4], inventarios[10], facturas[10,3]
	Definir opcion, codigo, cantidad, i, productosRegistrados, indiceFactura Como Entero
	Definir subtotal, iva, total Como Real
	Definir seguir Como Caracter
	productosRegistrados <- 9
	indiceFactura <- 1  
	
	codigos[1] <- LB001; nombres[1] <- "Refrigerador"; precios[1] <- 1500000; categorias[1] <- "Linea Blanca"; inventarios[1] <- 10
	codigos[2] <- LB002; nombres[2] <- "Lavadora"; precios[2] <- 2000000; categorias[1] <- "Linea Blanca"; inventarios[2] <- 15
	codigos[3]<- LB003; nombres[3] <- "Secadora"; precios[3] <- 2000000; categorias[1] <- "Linea Blanca"; inventarios[3] <- 8
	codigos[4] <- PE001; nombres[4] <- "Licuadora"; precios[4] <- 100000; categorias[2] <- "Pequeños electrodomesticos"; inventarios[4] <- 20
	codigos[5] <- PE002; nombres[5] <- "Cafetera"; precios[5] <- 80000; categorias[2] <- "Pequeños electrodomesticos"; inventarios[5] <- 20
	codigos[6] <- PE003; nombres[6] <- "Tostadora"; precios[6] <- 70000; categorias[2] <- "Pequeños electrodomesticos"; inventarios[6] <- 20
	codigos[7] <- E001; nombres[7] <- "Televisor"; precios[7] <- 6000000; categorias[3] <- "Entretenimiento"; inventarios[7] <- 20
	codigos[8] <- E002; nombres[8] <- "sistema de sonido"; precios[8] <- 4000000; categorias[3] <- "Entretenimiento"; inventarios[8] <- 20
	codigos[9] <- AC001; nombres[9] <- "Equipo de climatizacion"; precios[9] <- 1500000; categorias[4] <- "Aires acondicionados"; inventarios[9] <- 20
	
	Repetir
		Escribir " Sistema de Facturación "
		Escribir "1. Ver catálogo de productos"
		Escribir "2. Agregar un nuevo producto al catálogo"
		Escribir "3. Registrar una venta"
		Escribir "4. Ver facturas registradas"
		Escribir "5. Salir"
		Escribir "Seleccione una opción:"
		Leer opcion
		
		Si opcion = 1 Entonces
			Escribir "Catálogo de productos:"
			Para i <- 1 Hasta productosRegistrados Hacer
				Escribir "Código: ", codigos[i], " | Nombre: ", nombres[i], " | Precio: $", precios[i], " | Inventario: ", inventarios[i]
			Fin Para
			
		Sino 
			Si opcion = 2 Entonces
				Si productosRegistrados < 10 Entonces
					productosRegistrados <- productosRegistrados + 1
					Escribir "Ingrese el código del nuevo producto:"
					Leer codigos[productosRegistrados]
					
					Definir existe Como Logico
					existe <- Falso
					Para i <- 1 Hasta productosRegistrados - 1 Hacer
						Si codigos[i] = codigos[productosRegistrados] Entonces
							existe <- Verdadero
						Fin Si
					Fin Para
					Si existe Entonces
						Escribir "El código ya existe. No se puede agregar el producto."
						productosRegistrados <- productosRegistrados - 1
					Sino
						Escribir "Ingrese el nombre del nuevo producto:"
						Leer nombres[productosRegistrados]
						Escribir "Ingrese el precio unitario del producto:"
						Leer precios[productosRegistrados]
						Si precios[productosRegistrados] <= 0 Entonces
							Escribir "El precio debe ser mayor a 0."
							productosRegistrados <- productosRegistrados - 1
						Sino
							Escribir "Ingrese la categoría (1=Línea Blanca, 2=Pequeños Electrodomésticos, 3=Entretenimiento, 4=Aires Acondicionados):"
							Leer categorias[productosRegistrados]
							Escribir "Ingrese la cantidad inicial en inventario:"
							Leer inventarios[productosRegistrados]
							Si inventarios[productosRegistrados] < 0 Entonces
								Escribir "El inventario no puede ser negativo."
								productosRegistrados <- productosRegistrados - 1
							Fin Si
						Fin Si
					Fin Si
				Sino
					Escribir "El catálogo está lleno, no se pueden agregar más productos."
				Fin Si
				
			Sino 
				Si opcion = 3 Entonces
					subtotal <- 0
					Repetir
						Definir encontrado Como Logico
						encontrado <- Falso
						Escribir "Ingrese el código del producto que desea comprar:"
						Leer codigo
						Para i <- 1 Hasta productosRegistrados Hacer
							Si codigos[i] = codigo Entonces
								encontrado <- Verdadero
								Escribir "Producto seleccionado: ", nombres[i], " | Precio unitario: $", precios[i], " | Inventario: ", inventarios[i]
								Escribir "Ingrese la cantidad deseada:"
								Leer cantidad
								Si cantidad > 0 Y cantidad <= inventarios[i] Entonces
									inventarios[i] <- inventarios[i] - cantidad
									subtotal <- subtotal + (precios[i] * cantidad)
								Sino
									Escribir "Cantidad inválida o insuficiente en inventario."
								Fin Si
							Fin Si
						Fin Para
						Si No encontrado Entonces
							Escribir "Código no válido. Intente nuevamente."
						Fin Si
						Escribir "¿Desea agregar otro producto a la venta? (S/N):"
						Leer seguir
					Hasta Que seguir = "N"
					
					iva <- subtotal * 0.19
					total <- subtotal + iva
					Escribir "Resumen de la venta:"
					Escribir "Subtotal: $", subtotal
					Escribir "IVA (19%): $", iva
					Escribir "Total a pagar: $", total
					
					Si indiceFactura <= 10 Entonces
						facturas[indiceFactura,1] <- subtotal
						facturas[indiceFactura,2] <- iva
						facturas[indiceFactura,3] <- total
						indiceFactura <- indiceFactura + 1
					Sino
						Escribir "No se pueden guardar más facturas."
					Fin Si
					
				Sino 
					Si opcion = 4 Entonces
						Escribir "Facturas registradas:"
						Para i <- 1 Hasta indiceFactura - 1 Hacer
							Escribir "Factura ", i, " | Subtotal: $", facturas[i,1], " | IVA: $", facturas[i,2], " | Total: $", facturas[i,3]
						Fin Para
						
					Sino 
						Si opcion = 5 Entonces
							Escribir "Saliendo del sistema. ¡Gracias por usar Facturación ElectroMundo!"
							
						Sino
							Escribir "Opción inválida, intente nuevamente."
						Fin Si
					fin si 
				fin si 
			fin si		
		fin si 
	Hasta Que opcion = 5

FinAlgoritmo

