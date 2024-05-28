%%
%% This is file `aleph-notas.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% aleph-notas.dtx  (with options: `aleph-notas')
%% 
%% This is a generated file.
%% LaTeX class for typesetting notes
%% 
%% Copyright (C) 2020 by Andres Merino <mat.andresmerino@gmail.com>
%% 
%% Para un mejor uso y entendimiento de la actual clase,
%% consultar la documentación.
%% 
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{aleph-notas}[2020/08/14 v1.1]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  First, we define a series of auxiliary commands for the options
%\newcommand\@idioma{spanish,es-noitemize}
\newcommand\@tipo{}
\RequirePackage{ifthen}
\newboolean{comments}\setboolean{comments}{false}
\newboolean{codigo}\setboolean{codigo}{false}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Font size options.
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
%% Default page size options |compact| and |wide|.
\DeclareOption{amplio}{
    \PassOptionsToPackage{paperwidth=195mm,paperheight=265mm,twoside,
    inner=2.2cm,outer=2.2cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{compacto}{
    \PassOptionsToPackage{paperwidth=160mm,paperheight=240mm,twoside,
    inner=1.7cm,outer=1.7cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{a4}{
    \PassOptionsToPackage{paperwidth=210mm,paperheight=297mm,twoside,
    inner=2.2cm,outer=2.2cm,top=2.25cm,bottom=2.25cm}{geometry}}
\DeclareOption{letterpaper}{
    \PassOptionsToPackage{letterpaper,
    inner=2.cm,outer=2.cm,top=1.5cm,bottom=1.9cm}{geometry}}
\DeclareOption{a5}{
    \PassOptionsToPackage{paperwidth=148mm,paperheight=210mm,twoside,
    inner=1.7cm,outer=1.7cm,top=2.25cm,bottom=2.25cm}{geometry}}
%% Format option |fclassic| or |fnew|.
\DeclareOption{fclasico}{\renewcommand\@tipo{fclasico}}
\DeclareOption{fnuevo}{\renewcommand\@tipo{fnuevo}}
%% Option to display comments
\DeclareOption{comments}{\setboolean{comments}{true}}
%% Option to display codes
\DeclareOption{codigo}{\setboolean{codigo}{true}}
%% Default options are |compact|, |fclassic|, and |10pt|.
\ExecuteOptions{compacto,fclasico,10pt}
\ProcessOptions\relax
\LoadClass{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The following packages are required to format the document.
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%\RequirePackage[\@idioma]{babel}
\RequirePackage{calc}
\RequirePackage{etex}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amsthm}
\RequirePackage{mdframed}
\RequirePackage[many]{tcolorbox}
\RequirePackage{fontawesome}
\RequirePackage{mathpazo}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{comment}
\RequirePackage[many]{tcolorbox}
\RequirePackage[font={small},labelfont={bf,small},
   justification=centerlast]{caption}
\RequirePackage{float}
\RequirePackage{geometry}
\RequirePackage[colorlinks,linkcolor=black,urlcolor=black,
   citecolor=black,bookmarks=true]{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Internal variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The following is the list of internal variables used for formatting.
\newcommand\@university{Unverisity of Waterloo}
\newcommand\@longtitulo{0.75\linewidth}
\newcommand\@interlineado{1.2}
\newcommand\@espteo{-0.75ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Default colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The following are the predefined colors of the class.
\definecolor{colordef}{cmyk}{0.81,0.62,0.00,0.22}
\definecolor{colortext}{cmyk}{0.81,0.62,0.00,0.22}
\definecolor{colortitletext}{cmyk}{1,1,1,0.22}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Spacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% To improve the spacing between equations.
\AtBeginDocument{
   \addtolength{\abovedisplayskip}{-0.5mm}
   \addtolength{\belowdisplayskip}{-0.5mm}
    }
%% Line spacing
\newcommand{\interlineado}[1]{\renewcommand\@interlineado{#1}}
%% Space for theorem box
\newcommand{\espteo}[1]{\renewcommand\@espteo{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Data command definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% University
\newcommand{\university}[1]%
    {\renewcommand\@university{#1}}
%% Author: short author, normal author
%\newcommand{\autor}[2][]{\ifthenelse{\equal{#1}{}}
%   {\newcommand\@autorcorto{#2}\newcommand\@autor{#2}}
%   {\newcommand\@autorcorto{#1}\newcommand\@autor{#2}}}
%% Subject
\newcommand{\materia}[1]%
    {\newcommand\@materia{#1}}
%% Note
\newcommand{\note}[1]%
    {\newcommand\@note{#1}}
%% Topic
\newcommand{\topic}[1]%
    {\newcommand\@topic{ #1}}
%% Date
%\newcommand{\date}[1]%
%    {\newcommand\@date{#1}}
%% Logo one
\newcommand{\logouno}[2][0.1\linewidth]%
    {\newcommand\@logouno{#2}
    \newcommand\@longlogouno{#1}}
%% Logo two
\newcommand{\logodos}[2][0.1\linewidth]%
    {\newcommand\@logodos{#2}
    \newcommand\@longlogodos{#1}}
%% Title length
\newcommand{\longtitulo}[1]%
    {\renewcommand\@longtitulo{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Command to generate the title
\newcommand\@mytitle{
    \large\textbf{\textsc{\@university\\
    \ifthenelse{\isundefined{\@hoja}}{}{\@hoja\\}
    \normalsize
    \@materia\ \ $\bullet$\ \
    \@note}}\\
    \ifthenelse{\isundefined{\@topic}}{}{\normalsize\textsc{\@topic}\\}
    }
\newcommand\@inlogouno{
    \parbox{\@longlogouno}
    {\centering
    \ifthenelse{\isundefined{\@logouno}}{\hspace{0em}}
        {\includegraphics[width=0.95\linewidth]{\@logouno}}}
    }
\newcommand\@inlogodos{
    \parbox{\@longlogodos}
    {\centering
    \ifthenelse{\isundefined{\@logodos}}{\hspace{0pt}}
        {\includegraphics[width=0.95\linewidth]{\@logodos}}}
    }
%% Command to generate the header
\newcommand{\generateHeader}{
    \vspace*{-10mm}
    \begingroup\color{colortitletext}
    \thispagestyle{plain}
    \noindent
    \begin{minipage}{0.999\linewidth}
    \begin{center}
    \hrule
    \vspace{2mm}
    \ifthenelse{\isundefined{\@logodos}}
        {\ifthenelse{\isundefined{\@logouno}}
            {\@mytitle}
            {
                \@inlogouno
                \parbox{\@longtitulo}{\centering \@mytitle}
            }
        }
        {
            \@inlogouno\hfill
            \parbox{\@longtitulo}{\centering \@mytitle}\hfill
            \@inlogodos
        }
    \end{center}
    \vspace{0mm}
    \noindent
    \@date\hspace{\fill}
    \@author\\[-3mm]
    \hrule
    \end{minipage}
    \endgroup
    \vspace{5mm}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Page style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Line spacing
\renewcommand{\baselinestretch}{\@interlineado}
%% Header and footer
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\fancyhead[LE,RO]{\bfseries\@autorcorto}
\fancyhead[LO,RE]{\bfseries\@note}
\renewcommand{\headrulewidth}{.2pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{.1pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Title style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Section style
\titleformat{\section}[display]
    {\vspace*{-2mm}\bfseries\scshape\centering}
    {}{1ex}
    {\color{colortext}\large\titlerule\vspace{.05ex}
    \thesection.\ }
    [\color{colortext}\vspace{.2ex}\titlerule]
%% Subsection style
\titleformat{\subsection}
    {\color{colortext}\normalsize\bfseries}
    {\thesubsection}{1em}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Theorem style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Temporary keys: |type|, |color|, |counter|, and |icon|.
\def\tcb@@tipo{}
    \tcbset{ tipo/.code = {\def\tcb@@tipo{#1} } }
\def\tcb@@contador{}
    \tcbset{ contador/.code = {\def\tcb@@contador{#1} } }
\def\tcb@@color{colordef}
    \tcbset{ color/.code = {\def\tcb@@color{#1} } }
\def\tcb@@icono{{\large\faWarning}}
    \tcbset{ icono/.code = {\def\tcb@@icono{#1} } }
%% Classic theorem style
\newtheoremstyle{theoremStyle}%
    {9pt}{9pt}{}{0pt}{\bfseries\scshape}{.}{ }{}
%% New theorem style
\newtheoremstyle{theoremStyle}%
    {9pt}{9pt}{}{0pt}{\bfseries\sffamily\color{\tcb@@color}}{}{ }{\thmname{#1}\thmnumber{ #2}.\thmnote{ --#3--}}
%% Classic style formats
%%
%% Frame without separate title
\tcbset{ recuadrost/.style ={
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!5,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    parbox=false
    }
    }
%% Title writing
\newcommand\tbc@escrituratitulo[1][]{%
    \strut{%
        \bfseries\scshape\tcb@@tipo~\arabic{\tcb@@contador}%
            \ifthenelse{\equal{#1}{}}{}{:\upshape~#1}%
        }
    }
%% Drawing of the title on the left
\newcommand\tbc@dibujotituloizq[1][]{%
    % Creation of the name to measure it
    \node[xshift=13pt,yshift=\@espteo,thick,anchor=west](titulo) at (frame.north west)%
        {\tbc@escrituratitulo[#1]};
    % Shadow of the frame
    \path[fill=\tcb@@color!60!black]
        ([yshift=-1.75ex,xshift=-0.1ex]titulo.north west)
        arc[start angle=0,end angle=180,radius=0.9ex]
        ([yshift=-1.75ex,xshift=0.1ex]titulo.north east)
        arc[start angle=180,end angle=0,radius=0.9ex];
    % Frame
    \path[fill=\tcb@@color!20]
        % Top line
        ([xshift=-0.9ex,yshift=-0.85ex]titulo.north west)
        -- ([xshift=0.9ex,yshift=-0.85ex]titulo.north east)
        % Bottom line
        [rounded corners=0.7ex]  --  ([xshift=0.4ex,yshift=-0.95ex]titulo.north east)--
        ([yshift=0.6ex]titulo.south east) -- ([yshift=0.6ex]titulo.south west)
        % Cycle
        --  ([xshift=-0.4ex,yshift=-0.95ex]titulo.north west)
        [sharp corners] -- cycle;
    % Writing of the name
    \node[xshift=13pt,yshift=-0.8ex,thick,anchor=west] at (frame.north west)%
        {\tbc@escrituratitulo[#1]};
    }
%% Frame with separate title on the left
\tcbset{ recuadroctizq/.style ={
    % General options
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!5,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=4mm,bottom=0.5mm,left=2mm,right=2mm,
    topsep at break=-4mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    parbox=false,
    % Drawing of the title
    overlay unbroken and first = {\tbc@dibujotituloizq[#1]}
    }
    }
%% Drawing of the title on the right
\newcommand\tbc@dibujotituloder[1][]{%
    % Creation of the name to measure it
    \node[xshift=-13pt,yshift=\@espteo,thick,anchor=east](titulo) at (frame.north east)%
        {\tbc@escrituratitulo[#1]};
    % Shadow of the frame
    \path[fill=\tcb@@color!60!black]
        ([yshift=-1.75ex,xshift=-0.1ex]titulo.north west)
        arc[start angle=0,end angle=180,radius=0.9ex]
        ([yshift=-1.75ex,xshift=0.1ex]titulo.north east)
        arc[start angle=180,end angle=0,radius=0.9ex];
    % Frame
    \path[fill=\tcb@@color!20]
        % Top line
        ([xshift=-0.9ex,yshift=-0.85ex]titulo.north west)
        -- ([xshift=0.9ex,yshift=-0.85ex]titulo.north east)
        % Bottom line
        [rounded corners=0.7ex]  --  ([xshift=0.4ex,yshift=-0.95ex]titulo.north east)--
        ([yshift=0.6ex]titulo.south east) -- ([yshift=0.6ex]titulo.south west)--
        % Cycle
        ([xshift=-0.4ex,yshift=-0.95ex]titulo.north west)
        [sharp corners] -- cycle;
    % Writing of the name
    \node[xshift=-13pt,yshift=-0.8ex,thick,anchor=east] at (frame.north east)%
        {\tbc@escrituratitulo[#1]};
    }
%% Frame with a separate title on the right
\tcbset{ recuadroctder/.style ={
    % General options
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=\tcb@@color!5,colframe=\tcb@@color,
    boxrule=0pt,leftrule=2pt,
    top=4mm,bottom=0.5mm,left=2mm,right=2mm,
    topsep at break=-4mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    parbox=false,
    % Drawing of the title
    overlay unbroken and first= {\tbc@dibujotituloder[#1]}
    }
    }
%% Post-it style
\tcbset{ postit/.style ={
    % -> General options
    breakable,enhanced,
    before skip=2mm,after skip=3mm,
    colback=\tcb@@color!50,colframe=\tcb@@color!20!black,
    boxrule=0.4pt,
    drop fuzzy shadow,
    left=6mm,right=2mm,top=0.5mm,bottom=0.5mm,
    sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
    parbox=false,
    underlay unbroken and last = {%
        \path[fill=tcbcolback!80!black]
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm]
        ([yshift=3mm]interior.south east) --++ (-0.4,-0.1) --++ (0.1,-0.2);
        \path[fill=\tcb@@color!50!black,draw=none]
        (interior.south west) rectangle node[white]{\tcb@@icono} ([xshift=5.5mm]interior.north west);
        },
    underlay = {%
        \path[fill=\tcb@@color!50!black,draw=none]
        (interior.south west) rectangle node[white]{\tcb@@icono} ([xshift=5.5mm]interior.north west);
        }
    }
    }
%% New style formats
%%
%% Frame with separate internal title
\tcbset{ recuadroctint/.style ={
    % -> General options
    before skip=10pt,arc=0mm,breakable,enhanced,
    colback=gray!5,colframe=gray!5,colbacktitle=gray!5,
    boxrule=0pt,toprule=0.4pt,
    drop fuzzy shadow,
    top=0.5mm,bottom=0.5mm,left=2mm,right=2mm,
    fontupper=\normalsize,
    code={\refstepcounter{\tcb@@contador}},
    parbox=false,
    % Drawing of the title
    overlay unbroken and first = {
        % Thick top border
        \draw[\tcb@@color,line width =2.5cm]
            ([xshift=1.25cm, yshift=0cm]frame.north west)--+(0pt,3pt);
        },
    overlay middle and last = { },
    title={
            \bfseries\sffamily\color{\tcb@@color}
                \tcb@@tipo~\arabic{\tcb@@contador}%
                \ifthenelse{\equal{#1}{}}{}{:~~--#1--}%
        },
    }
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Definition of theorem environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Theorems in the classic format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\equal{\@tipo}{fclasico}}
{
%% Environments without frames: |example| and |obs|.
\theoremstyle{theoremStyle}
    \newtheorem{example}{Example}
    \newtheorem*{obs}{Observation}
%% Environments with frames: |prop|, |cor|, |lem|, |ex|.
    \newtheorem{prop}{Proposition}
        \tcolorboxenvironment{prop}{color=colordef,recuadrost}
    \newtheorem{cor}[prop]{Corollary}
        \tcolorboxenvironment{cor}{color=colordef,recuadrost}
    \newtheorem{lem}[prop]{Lemma}
        \tcolorboxenvironment{lem}{color=colordef,recuadrost}
    \newtheorem{ex}{Exercise}
        \tcolorboxenvironment{ex}{color=colordef,recuadrost}
%% Environments with a separate title: |teo|.
\newtcolorbox{theorem}[1][]
    {tipo=Theorem,contador=prop,color=colordef,recuadroctizq={#1}}
%% Environments with a separate title: |defi|.
\newcounter{defi}
\renewcommand{\thedefi}{\arabic{defi}}
\newtcolorbox{defi}[1][]
    {tipo=Definición,contador=defi,color=colordef,recuadroctizq={#1}}
%% Environments with a separate title: |axiom|.
\newcounter{axiom}
\renewcommand{\theaxiom}{\arabic{axiom}}
\newtcolorbox{axiom}[1][]
    {tipo=axiom,contador=axiom,color=colordef,recuadroctizq={#1}}
%% Warning environments: |warning|.
\newtcolorbox{warning}
    {color=yellow,postit}
}
{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Theorems in the new format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Environments without frames: |ejem| and |obs|
\theoremstyle{theoremStyle}
    \newtheorem{example}{Example}
    \newtheorem*{obs}{\tikz \fill[colordef] (1ex,1ex) circle (3.5pt); Observaci\'on}
%% Environments with frames: |prop|, |cor|, |lem|, |ex|.
    \newtheorem{prop}{Proposition}
        \tcolorboxenvironment{prop}{%
            color=colordef,recuadrost,colback=gray!5,drop fuzzy shadow
        }
    \newtheorem{cor}[prop]{Corollary}
        \tcolorboxenvironment{cor}{%
            color=colordef,recuadrost,colback=gray!5,drop fuzzy shadow
        }
    \newtheorem{lem}[prop]{Lemma}
        \tcolorboxenvironment{lem}{%
            color=colordef,recuadrost,colback=gray!5,drop fuzzy shadow
        }
    \newtheorem{ex}{Exercise}
        \tcolorboxenvironment{ex}{%
            color=colordef,recuadrost,colback=gray!5,drop fuzzy shadow
        }
%% Environments with a separate title: |teo|.
\newtcolorbox{teo}[1][]
    {tipo=Teorema,contador=prop,color=colordef,recuadroctint={#1}}
%% Environments with a separate title: |defi|.
\newcounter{defi}
\renewcommand{\thedefi}{\arabic{defi}}
\newtcolorbox{defi}[1][]
    {tipo=Definici\'on,contador=defi,color=colordef,recuadroctint={#1}}
%% Environments with a separate title: |axiom|.
\newcounter{axiom}
\renewcommand{\theaxiom}{\arabic{axiom}}
\newtcolorbox{axiom}[1][]
    {tipo=axiom,contador=axiom,color=colordef,recuadroctint={#1}}
%%  Ambientes warning: |warning|.
\newtcolorbox{warning}
    {color=yellow,postit}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% --- Optional Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comment style for the teacher
\ifthenelse{\boolean{comments}}{
    \newtcolorbox{comments}{
        breakable,
        enhanced,
        outer arc=0pt, arc=0pt,
        colframe=colordef!20,
        colback=white,
        attach boxed title to top left,
        boxed title style={
            colback=colordef!20,
            outer arc=0pt, arc=0pt,
            boxrule=0pt,
        },
        boxrule=0pt,
        borderline west = {1.5pt}{0pt}{colordef!50},
        borderline south = {1.5pt}{0pt}{colordef!50},
        left=1mm,
        fontlower=\small,
        title=\textbf{\textsc{\small \textcolor{black}{Methodological suggestions:}}}
        }
    }
    {\excludecomment{comments}}
%% Code style for the teacher
\ifthenelse{\boolean{codigo}}{
    \newtcolorbox{codigo}{
    blanker,breakable, left=3mm, before skip=10pt, after skip=10pt, borderline west={1mm}{0pt}{colordef!50}, fontlower=\small}
    }
    {\excludecomment{codigo}}
%%  Y ¡se acabó!
\endinput
%%
%% End of file `aleph-notas.cls'.
