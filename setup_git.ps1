# Script para inicializar el repositorio Git (Ejecutar DESPUÉS de instalar Git)

# 1. Verificar si git está instalado
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Git no está instalado o no está en el PATH." -ForegroundColor Red
    Write-Host "Por favor, instala Git primero y reinicia la terminal."
    exit
}

# 2. Inicializar repositorio
git init -b main
if ($LASTEXITCODE -ne 0) { git init; } # Fallback para versiones viejas de git

# 2.1 Configurar usuario (para que los commits sean tuyos)
git config user.email "nicofloresp2004@gmail.com"
git config user.name "AS Software"

# 3. Configurar .gitignore (básico para .NET/Blazor)
$gitignore = @"
bin/
obj/
.vs/
.vscode/
*.user
*.suo
wwwroot/sample-data/
"@
Set-Content .gitignore $gitignore

# 4. Añadir archivos
git add .

# 5. Commit inicial
git commit -m "Initial commit: Landing Page AS Software Solutions (Blazor WASM)"

Write-Host "Repositorio inicializado correctamente." -ForegroundColor Green
Write-Host "Creado commit a nombre de: nicofloresp2004@gmail.com"
Write-Host "---------------------------------------------------------"
Write-Host "PASOS FINALES PARA SUBIR A GITHUB:"

# Asegurar que estamos en la rama correcta y el remoto es correcto
git remote remove origin
if ($LASTEXITCODE -ne 0) { Write-Host "Continuando..." }
git remote add origin https://github.com/nicofloress/ASLANDING.git

# Añadir cambios recientes (Netlify config, etc)
git add .
git commit -m "Fix: Downgrade to .NET 8 for Netlify compatibility"

git branch -M main
git push -u origin main

Write-Host "---------------------------------------------------------"
Write-Host "¡Subido a GitHub!"
Write-Host "Ahora ve a Netlify.com -> 'Add new site' -> 'Import an existing project' -> Elige GitHub -> Selecciona 'ASLANDING'"
Write-Host "Netlify detectará automáticamente el archivo netlify.toml y configurará todo."
