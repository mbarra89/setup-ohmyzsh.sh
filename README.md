# setup-ohmyzsh.sh

Este script automatiza la instalación y configuración de Zsh, Oh My Zsh y Powerlevel10k en Ubuntu. También instala algunos plugins útiles para mejorar la experiencia de terminal.

## Características
- Verifica si Zsh, Git, Curl y Wget están instalados, e instala los que faltan.
- Cambia la shell predeterminada a Zsh.
- Instala Oh My Zsh y el tema Powerlevel10k.
- Configura plugins como `zsh-autosuggestions` y `zsh-syntax-highlighting`.
- Realiza ajustes en el archivo `.zshrc` para una mejor experiencia de terminal.

## Requisitos
- Ubuntu (o una distribución basada en Debian).
- Acceso a sudo para instalar paquetes.

## Uso

1. Clona el repositorio o descarga el script:
  ```
   git clone https://github.com/usuario/setup-ohmyzsh.git
   cd setup-ohmyzsh
  ```
2. Asigna permisos de ejecución:
  ```
    chmod +x setup-ohmyzsh.sh
  ```
3. Ejecuta el script:
  ```
  ./setup-ohmyzsh.sh
  ```
4. Después de ejecutar el script, cierra y vuelve a abrir tu terminal para aplicar los cambios.
