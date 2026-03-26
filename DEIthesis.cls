% DEIthesis.cls - UES Thesis class (XeLaTeX + biber) [APA + TNR 12pt + double]
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DEIthesis}[2025/08/21 UES Thesis Class APA]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,letterpaper,openany]{book}

% ---------- Core packages (XeLaTeX) ----------
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage{spanish}
\setotherlanguage{english}

% Tipografías por defecto de LaTeX/XeLaTeX (Latin Modern / Computer Modern).

% export in PDF/X, PDF/A, etc...
\RequirePackage{etoolbox}
\RequirePackage{colorprofiles}

% font and encodings
% \RequirePackage{newpxtext,newpxmath}
% \RequirePackage[T1]{fontenc}
\RequirePackage{unicode-math}

% Page & typography
\RequirePackage[top=2.5cm,bottom=2.5cm,left=3cm,right=2.5cm]{geometry}
\RequirePackage{microtype}
\RequirePackage{setspace}
\doublespacing

\RequirePackage{graphicx}
\graphicspath{{assets/}{res/}}

\RequirePackage{hyperref}
\hypersetup{
  pdfauthor={},
  pdftitle={},
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black
}

\RequirePackage{csquotes}

% ---------- Bibliography (APA with biber) ----------
% Requires biblatex-apa and language mapping
\RequirePackage[style=apa,backend=biber,sortcites=true,sorting=nyt]{biblatex}
\DeclareLanguageMapping{spanish}{spanish-apa}

\ExecuteBibliographyOptions{
  giveninits=false, % nombres completos (APA)
  doi=true, url=true, eprint=false,
  isbn=false, dashed=false, maxbibnames=20, maxcitenames=2
}
% URLs y DOIs siempre clicables
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat{doi}{\href{https://doi.org/#1}{doi.org/#1}}

\ExecuteBibliographyOptions{defernumbers=true, sorting=nyt, sortcites=true}
\ExecuteBibliographyOptions{citetracker=true, ibidtracker=false}
% activar en desarrollo:
% \ExecuteBibliographyOptions{checkbib=true, checkcitations=true}


% Floats, tables, code, algorithms
\RequirePackage{caption}
\captionsetup{labelfont=bf}

\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{float}

% Algorithms
\RequirePackage[ruled,vlined]{algorithm2e}
\renewcommand{\listalgorithmcfname}{Índice de algoritmos}
\renewcommand{\algorithmcfname}{Algoritmo}

% Listings for source code
\RequirePackage{listings}
\lstdefinestyle{ues}{
  basicstyle=\ttfamily\small,
  numbers=left,
  numberstyle=\tiny,
  stepnumber=1,
  numbersep=8pt,
  showstringspaces=false,
  breaklines=true,
  frame=single,
  captionpos=b,
  tabsize=2
}
\lstset{style=ues}
\renewcommand{\lstlistingname}{Código}
\renewcommand{\lstlistlistingname}{Índice de códigos fuente}

\SetAlgoInsideSkip{smallskip}
\SetAlgoCaptionLayout{centerline}


% --- Glosarios (sin indexador externo) ---
\RequirePackage[acronym,nonumberlist,toc]{glossaries}
\makenoidxglossaries

% Títulos en español (por si la lbf no los pone)
\providecommand{\glossaryname}{Glosario}
\providecommand{\acronymname}{Lista de acrónimos}

% Si en el documento se usa \printglossary, lo reencamino al modo no-index
\makeatletter
\AtBeginDocument{%
  \@ifundefined{printnoidxglossary}{}{%
    \renewcommand*{\printglossary}{\printnoidxglossary}%
  }%
}
\makeatother


% Cleveref for nice cross-refs
\RequirePackage[nameinlink,capitalise,noabbrev]{cleveref}

% Appendices
\RequirePackage{appendix}
% --- Nombres en español ---
\addto\captionsspanish{%
  \renewcommand{\appendixname}{Apéndice}%
  \renewcommand{\appendixtocname}{Apéndices}%
  \renewcommand{\appendixpagename}{Apéndices}%
}


% Evitar páginas en blanco de doble cara
\let\cleardoublepage\clearpage


% ---------- Spanish names ----------
\addto\captionsspanish{%
  \renewcommand{\contentsname}{Índice general}%
  \renewcommand{\listfigurename}{Índice de figuras}%
  \renewcommand{\listtablename}{Índice de tablas}%
}

% ---------- Helper macros ----------
\newcommand{\UESuniversity}{Universidad de El Salvador}
\newcommand{\UESfaculty}{Facultad de Ingeniería y Arquitectura}
\newcommand{\UESschool}{Escuela de Ingeniería de Sistemas Informáticos}
\newcommand{\UESdegree}{Ingeniero de Sistemas Informáticos}
\newcommand{\UEScity}{San Salvador}
\newcommand{\UESmonthyear}{\today}

\newcommand{\UEStitle}{Título del trabajo}
\newcommand{\UESadvisor}{Nombre del asesor}
\newcommand{\UEScoadvisor}{}
\newcommand{\UESrector}{}
\newcommand{\UESsecgral}{}
\newcommand{\UESdean}{}
\newcommand{\UESfacultysec}{}
\newcommand{\UESdirector}{}

\newcommand{\setuniversity}[1]{\renewcommand{\UESuniversity}{#1}}
\newcommand{\setfaculty}[1]{\renewcommand{\UESfaculty}{#1}}
\newcommand{\setschool}[1]{\renewcommand{\UESschool}{#1}}
\newcommand{\setdegree}[1]{\renewcommand{\UESdegree}{#1}}
\newcommand{\setcity}[1]{\renewcommand{\UEScity}{#1}}
\newcommand{\setmonthyear}[1]{\renewcommand{\UESmonthyear}{#1}}
\newcommand{\settitlethesis}[1]{\renewcommand{\UEStitle}{#1}}
\newcommand{\setadvisor}[1]{\renewcommand{\UESadvisor}{#1}}
\newcommand{\setcoadvisor}[1]{\renewcommand{\UEScoadvisor}{#1}}
\newcommand{\setrector}[1]{\renewcommand{\UESrector}{#1}}
\newcommand{\setsecgral}[1]{\renewcommand{\UESsecgral}{#1}}
\newcommand{\setdean}[1]{\renewcommand{\UESdean}{#1}}
\newcommand{\setfacultysec}[1]{\renewcommand{\UESfacultysec}{#1}}
\newcommand{\setdirector}[1]{\renewcommand{\UESdirector}{#1}}


% Logo path (default: UES color - red). User can override with \setlogopath{...}
\newcommand{\UESlogopath}{res/UESc_compressed.png}
\newcommand{\setlogopath}[1]{\renewcommand{\UESlogopath}{#1}}


% ---------- Authors (adicionales hasta 6) ----------
\newcommand{\UESauthori}{}     % 1
\newcommand{\UESauthorii}{}    % 2
\newcommand{\UESauthoriii}{}   % 3
\newcommand{\UESauthoriv}{}    % 4
\newcommand{\UESauthorv}{}     % 5
\newcommand{\UESauthorvi}{}    % 6

\newcommand{\setauthori}[1]{\renewcommand{\UESauthori}{#1}}
\newcommand{\setauthorii}[1]{\renewcommand{\UESauthorii}{#1}}
\newcommand{\setauthoriii}[1]{\renewcommand{\UESauthoriii}{#1}}
\newcommand{\setauthoriv}[1]{\renewcommand{\UESauthoriv}{#1}}
\newcommand{\setauthorv}[1]{\renewcommand{\UESauthorv}{#1}}
\newcommand{\setauthorvi}[1]{\renewcommand{\UESauthorvi}{#1}}


\providecommand{\UESauthor}{}\providecommand{\UESauthori}{}\providecommand{\UESauthorii}{}
\providecommand{\UESauthoriii}{}\providecommand{\UESauthoriv}{}\providecommand{\UESauthorv}{}
\providecommand{\UESauthorvi}{}
\newcommand{\ifempty}[3]{\if\relax\detokenize{#1}\relax #2\else #3\fi}

\newcommand{\typesetauthors}{%
  \begingroup
  \singlespacing
  \centering\bfseries\normalsize
  \setlength{\parskip}{0.20cm}% solo compacta el espacio entre nombres
  % \ifempty{\UESauthor}{}{\UESauthor\par}
  \ifempty{\UESauthori}{}{\MakeUppercase{\UESauthori}\par}
  \ifempty{\UESauthorii}{}{\MakeUppercase{\UESauthorii}\par}
  \ifempty{\UESauthoriii}{}{\MakeUppercase{\UESauthoriii}\par}
  \ifempty{\UESauthoriv}{}{\MakeUppercase{\UESauthoriv}\par}
  \ifempty{\UESauthorv}{}{\MakeUppercase{\UESauthorv}\par}
  \ifempty{\UESauthorvi}{}{\MakeUppercase{\UESauthorvi}\par}
  \endgroup
}


% Logo helper: include if exists
\newcommand{\maybeincludegraphics}[2][0.25\textwidth]{%
  \IfFileExists{#2}{\includegraphics[width=#1]{#2}}{\fbox{\parbox[c][2cm][c]{#1}{\centering LOGO}}}%
}

% ---------- Frontmatter helpers ----------
\newcommand{\frontmatterpages}{%
  \frontmatter
  \pagestyle{plain}
  % Portada
  \input{frontmatter/portada}

  % Autoridades (en archivo separado)
  \input{frontmatter/autoridades}

  % Páginas de aprobación (en archivo separado)
  \input{frontmatter/aprobacion}

  % (Opcional) Dedicatoria
  \input{frontmatter/dedicatoria}

  % Agradecimientos
  \input{frontmatter/thanks}

  % (Opcional) Declaración jurada
  \input{frontmatter/declaracion_jurada}

  % Abstract y Resumen (en archivos separados; primero Abstract)
  \input{frontmatter/abstract}
  \input{frontmatter/resumen}

  % Índices
  \tableofcontents

  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Índice de figuras}
  \listoffigures

  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Índice de tablas}
  \listoftables

  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Índice de algoritmos}
  \listofalgorithms

  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Índice de códigos fuente}
  \lstlistoflistings

  % Lista de acrónimos (si usas acrónimos)
  \glsaddall % (opcional: muestra todos los acrónimos definidos)
  \printglossary[type=\acronymtype,title={Lista de acrónimos}]

  \clearpage
}

\newcommand{\mainmatterpages}{%
  \mainmatter
  \pagestyle{headings}

  % Cuerpo del documento (Adapta los capitulos a tu necesidad)
  \input{chapters/01_introduction}
  \input{chapters/02_conclusion}
}

% ---------- Bibliography ----------
\newcommand{\addbibfile}[1]{\addbibresource{#1}}

% ---------- Chapter formatting tweaks ----------
\RequirePackage{chngcntr}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\makeatletter
\@ifundefined{c@lstlisting}{
  % If listings hasn't defined the counter yet, defer until begin document
  \AtBeginDocument{
    \counterwithin{lstlisting}{chapter}
  }
}{
  \counterwithin{lstlisting}{chapter}
}
\makeatother
