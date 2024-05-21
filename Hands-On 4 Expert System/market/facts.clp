(deffacts ordenes-de-compra
   (orden-de-compra 
      (cliente-id 1) 
      (items "smartphone apple iPhone15 rojo 17000" 
             "tarjeta-de-credito banamex visa 2023-11-11"))
   (orden-de-compra 
      (cliente-id 2) 
      (items "smartphone samsung Note12 negro 16000" 
             "tarjeta-de-credito liverpool visa 2025-11-11"))
   (orden-de-compra 
      (cliente-id 3) 
      (items "computadora apple MacBookAir gris 25000" 
             "tarjeta-de-credito bbva mastercard 2024-11-11"))
	(orden-de-compra 
      (cliente-id 4) 
      (items "smartphone huawei P40 azul 11000" 
             "tarjeta-de-credito santander visa 2022-11-11")))

(deffacts tarjetas
   (tarjeta-de-credito (banco "banamex") (tipo "visa") (fecha-expiracion "2023-11-11"))
   (tarjeta-de-credito (banco "liverpool") (tipo "visa") (fecha-expiracion "2025-11-11"))
   (tarjeta-de-credito (banco "bbva") (tipo "mastercard") (fecha-expiracion "2024-11-11"))
   (tarjeta-de-credito (banco "santander") (tipo "visa") (fecha-expiracion "2022-11-11")))

(deffacts vales
   (vale (valor 100))
   (vale (valor 200))
   (vale (valor 300))
   (vale (valor 400)))