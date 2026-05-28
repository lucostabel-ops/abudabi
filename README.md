# Abu Dhabi

Proyecto web estatico para el control diario de Abu Dhabi. La aplicacion esta preparada para abrirse directamente en el navegador y para publicarse gratis en Netlify desde un repositorio de GitHub.

## Objetivo del proyecto

El objetivo es tener una herramienta simple en HTML, CSS y JavaScript para registrar y consultar informacion diaria de control operativo. El archivo principal preparado para publicacion es `index.html`.

La aplicacion guarda datos en el navegador mediante `localStorage` y permite exportar/importar respaldos JSON. Es recomendable exportar backups periodicamente si se usa como herramienta de trabajo diaria.

## Estructura recomendada

```text
GENERAL/
├── index.html
├── README.md
├── netlify.toml
├── .gitignore
├── control_diario_abudabi.html        # copia operativa local, ignorada por Git
├── control_diario_abudabi_datos.json  # datos locales, ignorados por Git
└── archivos .xlsx                     # planillas de trabajo, ignoradas por Git
```

Para GitHub y Netlify, los archivos importantes son:

```text
index.html
README.md
netlify.toml
.gitignore
```

## Como abrirlo localmente

Opcion simple:

1. Abrir la carpeta `C:\Users\lucac\Dropbox\ABUDABI\GENERAL`.
2. Hacer doble clic en `index.html`.
3. El sitio se abrira en el navegador predeterminado.

Opcion con servidor local, si se tiene Python instalado:

```bash
python -m http.server 8000
```

Luego abrir:

```text
http://localhost:8000
```

## Como versionarlo con GitHub desde terminal

> Nota: en esta terminal no se detecto Git instalado o disponible en el PATH. Si queres usar terminal, instala Git desde https://git-scm.com/ y luego volve a abrir la terminal.

Desde la carpeta del proyecto:

```bash
cd "C:\Users\lucac\Dropbox\ABUDABI\GENERAL"
git init
git add .
git commit -m "Preparar proyecto Abu Dhabi para GitHub y Netlify"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/TU-REPOSITORIO.git
git push -u origin main
```

Reemplazar `TU-USUARIO` y `TU-REPOSITORIO` por los datos reales del repositorio creado en GitHub.

Para futuras actualizaciones:

```bash
cd "C:\Users\lucac\Dropbox\ABUDABI\GENERAL"
git status
git add .
git commit -m "Actualizar sitio Abu Dhabi"
git push
```

## Como versionarlo con GitHub Desktop

1. Abrir GitHub Desktop.
2. Elegir **File > Add local repository**.
3. Seleccionar `C:\Users\lucac\Dropbox\ABUDABI\GENERAL`.
4. Si GitHub Desktop indica que no es un repositorio Git, elegir **create a repository**.
5. Revisar que se incluyan `index.html`, `README.md`, `netlify.toml` y `.gitignore`.
6. Verificar que no se suban planillas `.xlsx` ni archivos JSON de datos.
7. Escribir un mensaje de commit, por ejemplo: `Preparar proyecto Abu Dhabi`.
8. Hacer clic en **Commit to main**.
9. Hacer clic en **Publish repository**.
10. Elegir un nombre de repositorio, por ejemplo `abu-dhabi`.
11. Confirmar con **Publish Repository**.

## Como publicarlo gratis en Netlify

1. Entrar a [Netlify](https://www.netlify.com/).
2. Iniciar sesion con la cuenta de GitHub.
3. Elegir **Add new site > Import an existing project**.
4. Seleccionar GitHub como proveedor.
5. Autorizar Netlify si lo solicita.
6. Elegir el repositorio del proyecto.
7. Configurar:
   - **Build command**: dejar vacio.
   - **Publish directory**: `.`
8. Hacer clic en **Deploy site**.

Netlify detectara `index.html` en la raiz y publicara el sitio.

## Publicacion automatica

Una vez conectado GitHub con Netlify, cada vez que hagas commit y push a la rama principal (`main`), Netlify publicara automaticamente la version actualizada.

Flujo recomendado:

```bash
git add .
git commit -m "Descripcion del cambio"
git push
```

Despues del `push`, revisar el panel de Netlify para confirmar que el deploy termino correctamente.

## Recomendaciones para futuras actualizaciones

- Mantener `index.html` como archivo principal del sitio publicado.
- Si editas `control_diario_abudabi.html`, copiar esos cambios tambien a `index.html` antes de publicar.
- Si agregas CSS, JS o imagenes externas, usar carpetas simples como `css/`, `js/` e `img/`.
- Usar rutas relativas, por ejemplo `css/styles.css`, `js/app.js` o `img/logo.png`.
- No subir archivos privados, claves, datos sensibles, planillas internas ni respaldos JSON con informacion real.
- Exportar backups JSON desde la aplicacion si necesitas conservar datos de trabajo.
- Hacer commits pequenos y con mensajes claros.
- Verificar localmente el sitio antes de hacer `push`.
