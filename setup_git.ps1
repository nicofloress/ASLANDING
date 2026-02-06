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
Write-Host "1. Entra a GitHub y crea un repositorio llamado 'ASLANDING'"
Write-Host "2. Copia y pega estos comandos:"
Write-Host "   git remote add origin https://github.com/nicofloresp2004/ASLANDING.git"
Write-Host "   git push -u origin main"
