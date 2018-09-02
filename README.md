## Png 2 Mp4 in AWS 
### Descripción:
   Es un configuracion de una maquina Ubuntu linux con GDM3 para que al abrir sesion y al cerrarla se inicie y se acabe el proceso de captura de imagenes.

### Archivo del programa 

**install.sh**
Este es el instalador, requiere tener el Key and Passwd del S3, pues lo pregunta al ejecutarse

**Png2Mp4AWS.sh**
Este es el binario que hace toda la magia, se instala en /bin/ y se ejecuta pasandole diversos parametros:
{capture|confCron|rmCron|sendS3}

### Archivos de configuracion de GDM3
- PoLDefault
- PoSDefault
- PrSDefault

Estos archivos son usados para configurar /etc/gdm3/PreLogin /etc/gdm3/PostSession /etc/gdm3/PostLogin

