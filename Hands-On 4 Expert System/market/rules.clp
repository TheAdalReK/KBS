(defrule macbookair-iphone15-vales
   (orden-de-compra (items ?items))
   (test (and 
          (member$ "smartphone apple iPhone15 rojo 17000" ?items)
          (member$ "computadora apple MacBookAir gris 25000" ?items)))
   =>
   (bind ?total (+ 17000 25000))
   (bind ?vales (/ ?total 1000))
   (printout t "Oferta: " ?vales " vales de 100 pesos por la compra de MacBook Air y iPhone 15 al contado." crlf))

(defrule laptop-asus-descuento-mouse
   (orden-de-compra (items $?items))
   (test (member$ "computadora asus ZenBook13 gris 18000" ?items))
   =>
   (printout t "Oferta: Mouse gratis por la compra de una laptop Asus." crlf))   

(defrule smartphone-descuento-accesorios
   (orden-de-compra (items ?items))
   (test (or (member$ "smartphone apple iPhone15 rojo 17000" ?items)
             (member$ "smartphone samsung Note12 negro 16000" ?items)
             (member$ "smartphone google Pixel6 blanco 12000" ?items)
             (member$ "smartphone huawei P40 azul 11000" ?items)))
   =>
   (printout t "Oferta: 15% de descuento en funda y mica para la compra de un smartphone." crlf))

(defrule descuento-mayoristas
   (cliente (id ?id) (tipo mayorista))
   =>
   (printout t "Descuento especial aplicado para clientes mayoristas." crlf))

(defrule descuento-computadoras
   (orden-de-compra (items ?items))
   (test (or (member$ "computadora apple MacBookAir gris 25000" ?items)
             (member$ "computadora dell XPS15 negro 22000" ?items)
             (member$ "computadora hp SpectreX360 plateado 21000" ?items)
             (member$ "computadora lenovo ThinkPadX1 negro 20000" ?items)
             (member$ "computadora microsoft SurfaceLaptop4 azul 23000" ?items)
             (member$ "computadora asus ZenBook13 gris 18000" ?items)
             (member$ "computadora acer Swift3 plateado 15000" ?items)
             (member$ "computadora msi Stealth15M negro 27000" ?items)))
   =>
   (printout t "Descuento del 10% aplicado en accesorios para la compra de cualquier computadora." crlf))

(defrule oferta-accesorios-smartphones
   (orden-de-compra (items ?items))
   (test (or (member$ "smartphone apple iPhone15 rojo 17000" ?items)
             (member$ "smartphone samsung Note12 negro 16000" ?items)
             (member$ "smartphone google Pixel6 blanco 12000" ?items)
             (member$ "smartphone huawei P40 azul 11000" ?items)
             (member$ "smartphone xiaomi Mi11 negro 13000" ?items)
             (member$ "smartphone apple iPhone14 blanco 16000" ?items)
             (member$ "smartphone samsung GalaxyS21 azul 14000" ?items)
             (member$ "smartphone oneplus 10+ gris 14000" ?items)))
   =>
   (printout t "Oferta: 10% de descuento en accesorios para la compra de un smartphone." crlf))


(defrule laptop-dell-descuento-accesorios
   (orden-de-compra (items ?items))
   (test (member$ "computadora dell XPS15 negro 22000" ?items))
   =>
   (printout t "Oferta: 20% de descuento en accesorios para la compra de una Dell XPS 15." crlf))

(defrule smartphone-samsung-descuento-cargador
   (orden-de-compra (items ?items))
   (test (or (member$ "smartphone samsung Note12 negro 16000" ?items)
			 (member$ "smartphone samsung GalaxyS21 azul 14000" ?items)))
   =>
   (printout t "Oferta: 10% de descuento en cargadores para la compra de un smartphone Samsung." crlf))

(defrule laptop-hp-descuento-mochila
   (orden-de-compra (items ?items))
   (test (member$ "hp SpectreX360 plateado 21000" ?items))
   =>
   (printout t "Oferta: Mochila gratis para laptops por la compra de una HP." crlf))

(defrule iphone15-banamex-24-meses
   (orden-de-compra (items ?items))
   (test (and 
          (member$ "smartphone apple iPhone15 rojo 17000" ?items)
          (member$ "tarjeta-de-credito banamex visa 2023-12-01" ?items)))
   =>
   (printout t "Oferta: 24 meses sin intereses para iPhone 15 con tarjeta Banamex." crlf))
   
(defrule smartphone-huawei-descuento-auriculares
   (orden-de-compra (items $?items))
   (test (member$ "smartphone huawei P40 azul 11000" ?items))
   =>
   (printout t "Oferta: 15% de descuento en auriculares para la compra de un smartphone Huawei." crlf))

(defrule accesorio-dell-monitor
   (orden-de-compra (items $?items))
   (test (member$ "accesorio monitor dell 4500" ?items))
   =>
   (printout t "Oferta: Cable HDMI gratis por la compra de un monitor Dell." crlf))

(defrule laptop-microsoft-descuento-software
   (orden-de-compra (items $?items))
   (test (member$ "computadora microsoft SurfaceLaptop4 azul 23000" ?items))
   =>
   (printout t "Oferta: 50% de descuento en software Office por la compra de una laptop Microsoft." crlf))

(defrule tarjeta-bbva-descuento-especial
   (orden-de-compra (items $?items))
   (test (member$ "tarjeta-de-credito bbva mastercard 2024-12-01" ?items))
   =>
   (printout t "Oferta: Descuento del 10% en todas las compras con tarjeta BBVA Mastercard." crlf))

(defrule tarjeta-santander-meses-sin-intereses
   (orden-de-compra (items $?items))
   (test (member$ "tarjeta-de-credito santander visa 2022-12-01" ?items))
   =>
   (printout t "Oferta: 18 meses sin intereses con tarjeta Santander." crlf))

(defrule smartphone-pixel-descuento-accesorios
   (orden-de-compra (items $?items))
   (test (member$ "smartphone google Pixel6 blanco 12000" ?items))
   =>
   (printout t "Oferta: 10% de descuento en accesorios para la compra de un Google Pixel 6." crlf))


(defrule cliente-vip-descuento-especial
   (cliente (id ?id) (tipo vip))
   =>
   (printout t "Descuento especial del 20% para clientes VIP." crlf))

(defrule samsung-note12-liverpool-12-meses
   (orden-de-compra (items ?items))
   (test (and 
          (member$ "smartphone samsung Note12 negro 15000" ?items)
          (member$ "tarjeta-de-credito liverpool visa 2025-12-01" ?items)))
   =>
   (printout t "Oferta: 12 meses sin intereses para Samsung Note 12 con tarjeta Liverpool VISA." crlf))

(defrule smartphone-xiaomi-descuento-funda
   (orden-de-compra (items $?items))
   (test (member$ "smartphone xiaomi Mi11 negro 13000" ?items))
   =>
   (printout t "Oferta: Funda gratis por la compra de un smartphone Xiaomi." crlf))

(defrule laptop-lenovo-descuento-teclado
   (orden-de-compra (items $?items))
   (test (member$ "computadora lenovo ThinkPadX1 negro 20000" ?items))
   =>
   (printout t "Oferta: 15% de descuento en teclados por la compra de una laptop Lenovo." crlf))

(defrule smartphone-iphone-antivirus
   (orden-de-compra (items $?items))
   (test (member$ "smartphone apple iPhone14 blanco 16000" ?items))
   =>
   (printout t "Oferta: Antivirus gratuito por la compra de cualquier iPhone." crlf))

