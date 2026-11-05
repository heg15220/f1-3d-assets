# F1 3D Assets

Modelos 3D (GLB) para el proyecto OverCut GP:

- `coches/<año>/` — coches de F1 por temporada.
- `circuitos/<nombre>/` — circuitos, autódromos, speedways, karts y trazados descargados de Sketchfab
  con licencia que permite uso comercial (CC BY, CC BY-SA, CC BY-ND o CC0). Cada carpeta incluye un
  `ATTRIBUTION.txt` con autor, enlace original y licencia.

Los archivos binarios **no están en git**: se guardan como assets de **GitHub Releases**, una release por carpeta.
El tag es la ruta normalizada (minúsculas, sin acentos ni espacios):
`coches/2005` → `coches-2005`, `circuitos/Circuit Zolder` → `circuitos-circuit-zolder`.
El listado completo está en [MANIFEST.md](MANIFEST.md). Los `ATTRIBUTION.txt` sí están en git.

## Actualizar
1. Añade/descarga archivos en `coches/<año>/`, `circuitos/<nombre>/` (o cualquier `<categoria>/<subcarpeta>/`).
2. Ejecuta `./sync.sh` desde Git Bash (sube solo lo nuevo o modificado).
3. `git add MANIFEST.md circuitos && git commit -m "Actualiza manifiesto" && git push`

## Descargar
```bash
gh release download coches-2005 -R heg15220/f1-3d-assets -D coches/2005
gh release download circuitos-circuit-zolder -R heg15220/f1-3d-assets -D "circuitos/Circuit Zolder"
```

## Licencias
Los modelos proceden de terceros; revisa la licencia de cada uno antes de redistribuirlos.

- **CC BY / BY-SA**: uso comercial permitido citando al autor (BY-SA obliga a compartir derivados con la misma licencia).
- **CC BY-ND**: uso comercial permitido, pero **no** se permiten obras derivadas (modificar el modelo).
- Muchos circuitos están etiquetados como *ripped* (extraídos de videojuegos como F1 2010, Assetto Corsa,
  Real Racing 3, Race Driver GRID…). Aunque el autor de la subida los publique con licencia abierta,
  puede no tener los derechos: **riesgo legal para uso comercial**.
