# Research Studio — MVP express

Panel académico para organizar manuscritos científicos. Primera versión estática, sin dependencias.

## Funcionalidades
- Dashboard y creación de proyectos.
- Estructuras IMRyD, IMRyDI e IDyC.
- Editor de secciones con guardado en `localStorage`.
- Objetivos y notas de investigación.
- Biblioteca de referencias manual.
- Exportación de manuscritos a TXT.
- Respaldo e importación JSON.

## Abrir
Abre `index.html` en un navegador o publica la rama `main` desde GitHub Pages usando la carpeta raíz `/ (root)`.

## Importante: límites y privacidad
Esta versión **no es multiusuario**: no tiene autenticación, permisos, sincronización, colaboración remota, integración IA ni exportación DOCX. Los artículos se guardan solo en el navegador y pueden perderse si se limpia el almacenamiento. No ingreses manuscritos confidenciales ni datos personales sensibles. Al habilitar GitHub Pages el sitio será accesible públicamente aunque más tarde se use un backend privado.

## Siguiente fase
1. Autenticación con Supabase.
2. PostgreSQL con políticas RLS y pruebas de aislamiento.
3. Sincronización de proyectos y miembros.
4. Revisión bibliográfica mediante Crossref/OpenAlex.
5. Exportación DOCX y asistencia IA en backend con control de consumo.

Licencia: no se concede licencia de reutilización hasta que el titular elija una licencia explícita.
