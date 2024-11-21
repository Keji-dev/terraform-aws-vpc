Esta estructura se representaria cada envs en 1 report Github diferente, individualmente cada uno. Por lo que cada modulo independiente estara en su propio Github

Convencion del nombre repo: terraform-aws-vpc, terraform-aws-subnet

En envs/dev y envs/prod cambiaremos los module sources a nuestro link ssh de github poniendole el tag al final

Pasos a realizar en github:
1.- Creamos repositorio privado terraform-aws-vpc
2.- Clonamos el repo en nuestro pc
3.- Llevamos nuestros archivos de envs al repo local
4.- Hacemos git add . , git commit -m "create vpc module" , git tag "0.1.0" , git push origin main --tags
5.- Vamos a nuestra carpeta con la infra y actualizamos el tag en el source del modulo
6.- Vamos a nuestro carpeta con la infra y hacemos Terraform apply

Si queremos actualizar la infra, lo hacemos en el repo local de github y lo subimos a github con un nuevo commit y un nuevo tag, luego iremos al module y cambiaremos el tag al final del link de github. Luego hacemos terraform apply

Este approach tiene un problema, si tenemos cientos de modulos tendremos que tener cientos de githubs e ir cambiando el tag y haciendo terraform apply por cada uno. Para mejorar este approach es mejor crear modules reusables por ejemplo, nuestra app puede tener el mismo autoscaling group, network load balancer. La version v2 es mas facil de manejar que la v3 pero es mas copia/pega

Para que esta estructura nivel intermedio funcione necesitamos crear ambos recursos en sus propias carpetas en modulos para usarlos como templates, con sus propias variables y providers.

La subnet requiere de una VPC para ser creada y funcionar, ademas tiene que conectarse a la VPC por lo que necesitamos el id de la VPC en la subnet.

1.- Para obtener la VPC ID necesitamos hacer un output de nuestro recurso
2.- Para obtener el VPC ID en la subnet, necesitamos un bloque data que obtenga el valor exactando desde un backend local hasta nuestra carpeta VPC desde la carpeta subnet
3.- Recordar que el cidr_block de la subnet tiene que tener una mascara diferente a nuestra mascara de VPC
4.- Para crear la subnet primero tenemos que crear la VPC sino, no funcionara, podemos usar el bash script que tenemos con todos los pasos para que se automatizen
5.- Para crear nuevos modules sin actualizar la estructura, crearemos versiones copiando la infra original y asi podemos editarla sin modificar los envs 

Si queremos actualizar a los nuevos modules, vamos al main.tf de cada envs y actualizamos el source apuntando al la nueva carpeta module

Siempre se prueba el envs/dev antes del prod, si todo funciona hacemos cambios en prod