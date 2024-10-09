# Git Branch Cleaner 🧹

Este script en Bash te ayuda a limpiar de manera rápida y segura las ramas locales de Git que ya han sido mergeadas o que no tienen una referencia remota (por ejemplo, después de haber sido eliminadas en el repositorio remoto).

## Características 🚀

- **Actualización automática del repositorio remoto**: Usa `git fetch -p` para sincronizar con el remoto y eliminar referencias obsoletas.
- **Listado de ramas locales sin referencia remota**: Muestra las ramas locales que ya no tienen una referencia en el remoto.
- **Listado de ramas mergeadas**: Muestra las ramas locales que ya han sido mergeadas.
- **Confirmación antes de eliminar**: Si hay ramas que se pueden eliminar, el script solicita confirmación antes de proceder.
- **Eliminación automática de ramas**: Tras la confirmación, las ramas locales mergeadas son eliminadas, y se limpia el remoto de ramas borradas.

## Requisitos 🛠️

- Tener instalado Git en tu sistema.
- Un repositorio local configurado en tu máquina.

## Instalación 📥

1. Clona el repositorio o descarga el archivo `limpiar_ramas.sh`.
   
```bash
git clone https://github.com/tu-usuario/git-branch-cleaner.git
```

2. Dale permisos de ejecución al archivo limpiar_ramas.sh:

```bash
chmod +x limpiar_ramas.sh
```

## Uso 📑

1. Navega a la carpeta donde tienes tu repositorio de Git.

2. Ejecuta el script con el siguiente comando:

```bash
./limpiar_ramas.sh
```

3. El script hará lo siguiente:

- Actualizará el repositorio remoto y eliminará referencias obsoletas.
- Listará las ramas locales que ya no tienen una referencia remota y las ramas locales que han sido mergeadas.
- Pedirá confirmación antes de eliminar las ramas.

4. Si confirmas, las ramas mergeadas y sin referencia remota serán eliminadas. También se limpiarán las ramas remotas eliminadas.

## Ejemplo de salida 🖥️

```bash
Actualizando el repositorio remoto y eliminando referencias obsoletas...

Las siguientes ramas locales ya no tienen una referencia remota asociada:
  feature/obsolete-branch   gone

Las siguientes ramas locales ya han sido mergeadas y se pueden eliminar:
  feature/completed-branch

¿Quieres eliminar las ramas mergeadas y sin referencia remota? (s/n): s

Eliminando las ramas mergeadas...
Deleted branch feature/completed-branch (was 123abc).

Limpiando ramas remotas eliminadas...
Pruning origin
```

## Contribuciones 🤝

Si deseas mejorar este script o tienes alguna sugerencia, siéntete libre de crear un Pull Request o abrir un Issue en el repositorio. ¡Todas las contribuciones son bienvenidas!