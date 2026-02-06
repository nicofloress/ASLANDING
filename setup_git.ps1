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
Write-Host "PASOS FINALES PARA SUBIR A GITHUB (Automatizados abajo si es posible):"
Write-Host "1. Se corregirá el remoto a: https://github.com/nicofloress/ASLANDING.git"
Write-Host "2. Se intentará subir el código."

# Forzar la actualización del remoto (borrar si existe y volver a crear)
git remote remove origin
if ($LASTEXITCODE -ne 0) { Write-Host "No existía origin previo, continuando..." }
git remote add origin https://github.com/nicofloress/ASLANDING.git

git branch -M main
git push -u origin main

Write-Host "---------------------------------------------------------"
Write-Host "Si el push falló (por autenticación), corre manualmente:"
Write-Host "git push -u origin main"
