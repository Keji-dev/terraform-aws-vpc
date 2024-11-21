Esta estructura se representaria en solamente 1 repo GitHub

Para que esta estructura nivel intermedio funcione necesitamos crear ambos recursos en sus propias carpetas en modulos para usarlos como templates, con sus propias variables y providers.

La subnet requiere de una VPC para ser creada y funcionar, ademas tiene que conectarse a la VPC por lo que necesitamos el id de la VPC en la subnet.

1.- Para obtener la VPC ID necesitamos hacer un output de nuestro recurso
2.- Para obtener el VPC ID en la subnet, necesitamos un bloque data que obtenga el valor exactando desde un backend local hasta nuestra carpeta VPC desde la carpeta subnet
3.- Recordar que el cidr_block de la subnet tiene que tener una mascara diferente a nuestra mascara de VPC
4.- Para crear la subnet primero tenemos que crear la VPC sino, no funcionara, podemos usar el bash script que tenemos con todos los pasos para que se automatizen
5.- Para crear nuevos modules sin actualizar la estructura, crearemos versiones copiando la infra original y asi podemos editarla sin modificar los envs 

Si queremos actualizar a los nuevos modules, vamos al main.tf de cada envs y actualizamos el source apuntando al la nueva carpeta module

Siempre se prueba el envs/dev antes del prod, si todo funciona hacemos cambios en prod