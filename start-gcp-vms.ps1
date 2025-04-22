Write-Host "Buscando VMs con etiquetas env=dev o env=prod para iniciarlas..."

# Obtener lista de instancias etiquetadas
$instances = gcloud compute instances list --filter="labels.env:(dev prod)" --format="value(name,zone)" | Where-Object { $_.Trim() -ne "" }

foreach ($instance in $instances) {
    # Separar nombre y zona correctamente, eliminando espacios innecesarios
    $parts = $instance.Trim() -split "\s+"
    $name = $parts[0]
    $zone = $parts[1]

    if ($name -and $zone) {
        Write-Host "Iniciando $name en $zone..."
        gcloud compute instances start $name --zone=$zone
    } else {
        Write-Host "⚠️  Saltando línea malformada: '$instance'"
    }
}

Write-Host "Todas las instancias etiquetadas fueron procesadas."
