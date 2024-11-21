Para que esta estructura nivel principiante funcione necesitamos crear ambos recursos en sus propias carpetas, con sus propias variables y providers.

La subnet requiere de una VPC para ser creada y funcionar, ademas tiene que conectarse a la VPC por lo que necesitamos el id de la VPC en la subnet.

1.- Para obtener la VPC ID necesitamos hacer un output de nuestro recurso
2.- Para obtener el VPC ID en la subnet, necesitamos un bloque data que obtenga el valor exactando desde un backend local hasta nuestra carpeta VPC desde la carpeta subnet
3.- Recordar que el cidr_block de la subnet tiene que tener una mascara diferente a nuestra mascara de VPC
4.- Para crear la subnet primero tenemos que crear la VPC sino, no funcionara, podemos usar el bash script que tenemos con todos los pasos para que se automatizen


Apply: La VPC se debe crear primero y luego la subnet
Destroy: La subnet debe destruirse primero y luego la VPC