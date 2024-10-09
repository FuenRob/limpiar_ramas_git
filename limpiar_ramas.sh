#!/bin/bash

# Obtener y limpiar referencias remotas obsoletas
echo "Actualizando el repositorio remoto y eliminando referencias obsoletas..."
git fetch -p

# Listar las ramas locales que ya no existen en el remoto (indicadas como 'gone')
echo -e "\nLas siguientes ramas locales ya no tienen una referencia remota asociada:"
gone_branches=$(git branch -vv | grep ': gone')

if [ -z "$gone_branches" ]; then
    echo "No hay ramas locales sin referencia remota."
else
    echo "$gone_branches"
fi

# Listar las ramas que han sido mergeadas
echo -e "\nLas siguientes ramas locales ya han sido mergeadas y se pueden eliminar:"
merged_branches=$(git branch --merged | grep -v "\*")

if [ -z "$merged_branches" ]; then
    echo "No hay ramas mergeadas que se puedan eliminar."
else
    echo "$merged_branches"

    # Si hay ramas que eliminar, pedir confirmación
    read -p "¿Quieres eliminar las ramas mergeadas y sin referencia remota? (s/n): " confirm

    if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
        # Eliminar las ramas mergeadas que no están activas
        echo -e "\nEliminando las ramas mergeadas..."
        echo "$merged_branches" | xargs -n 1 git branch -d

        # Prune de ramas remotas eliminadas
        echo -e "\nLimpiando ramas remotas eliminadas..."
        git remote prune origin

        echo -e "\nLimpieza completada ✅"
    else
        echo -e "\nNo se han eliminado ramas. Operación cancelada."
    fi
fi
