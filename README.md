# F1 3D Assets

Modelos 3D (GLB) de coches de F1 por temporada, para el proyecto OverCut GP.

Los archivos binarios **no están en git**: se guardan como assets de **GitHub Releases**, una release por carpeta
(`coches/2005` → tag `coches-2005`). El listado completo está en [MANIFEST.md](MANIFEST.md).

## Actualizar
1. Añade/descarga archivos en `coches/<año>/` (o cualquier `<categoria>/<subcarpeta>/`).
2. Ejecuta `./sync.sh` desde Git Bash (sube solo lo nuevo o modificado).
3. `git add MANIFEST.md && git commit -m "Actualiza manifiesto" && git push`

## Descargar
```bash
gh release download coches-2005 -R heg15220/f1-3d-assets -D coches/2005
```

> Los modelos proceden de terceros; revisa la licencia de cada uno antes de redistribuirlos.
