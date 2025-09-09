# Memoria PPG

Este trabajo es una memoria para trabajo de pregrado en Ingeniería de Sistemas Informáticos escrita en LaTeX para la Universidad de El Salvador.

## Autores:

- Kendal Alfonso Sosa Montes

## Tutor:
- Dr. Javier de Pedro Carracedo

## Co-Tutor:
- Ing. Bladimir Díaz Campos

# Prerequisitos

En Windows Instalar los aplicativos siguientes: 

- [MiKTeX](https://miktex.org/download)

- [TeXMaker](https://www.xm1math.net/texmaker/download.html)

Para distribuciones derivadas de Debian/Ubuntu:
```bash
sudo apt install texlive-full texmaker
```

### Instrucciones de compilación via terminal

```bash
user@linux:~$ pdflatex main;
user@linux:~$ biber main;
user@linux:~$ pdflatex main;
user@linux:~$ pdflatex main;
```
### Configuración en Visual Studio Code

En Visual Studio Code hay que agregar los siguientes plugins:

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [Spanish - Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [LaTeX Extension Pack](https://marketplace.visualstudio.com/items?itemName=LeoJhonSong.latex-extension-pack)

Agregar las siguientes configuraciones en el archivo settings.json del Usuario o del Workspace:

```json
{
  //...
  "cSpell.language": "en,es-ES",
  "editor.wordWrap": "on",
  "workbench.editorAssociations": {
    "*.pdf": "latex-workshop-pdf-hook"
  },
  "[latex]": {
    "editor.defaultFormatter": "nickfode.latex-formatter"
  },
  "latex-workshop.latex.recipes": [
    {
      "name": "pdflatex -> biber -> pdflatex x 2",
      "tools": ["pdflatex", "biber", "pdflatex", "pdflatex"]
    },
    {
      "name": "xelatex->biber->xelatex x 2",
      "tools": ["xelatex", "biber", "xelatex", "xelatex"]
    },
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOCFILE%"
      ]
    },
    {
      "name": "biber",
      "command": "biber",
      "args": ["%DOCFILE%"]
    },
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ],
      "env": {}
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": ["%DOCFILE%"],
      "env": {}
    },
  ]
  //...
}
```

Cada cambio que se guarde realizará una compilación del proyecto y se recargará el PDF obtenido de salida. 

Compilar el proyecto manualmente con LaTeX -> Build LaTeX Project.

Para ver el PDF resultante ir a la Extension de LaTeX -> View LaTeX PDF.