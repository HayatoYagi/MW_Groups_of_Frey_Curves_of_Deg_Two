\ProvidesClass{classes/mybeamer}[2024/01/19 mybeamer]

\LoadClass[unicode, aspectratio=169, dvipdfmx, cjk, 10pt]{beamer}

\usepackage{luatexja}% 日本語したい

\usepackage{amssymb, amsmath} % 高度な数式記述用パッケージ
\usepackage{mathtools} % 高度な数式記述用パッケージ

\setbeamertemplate{theorems}[numbered]  %% 定理に番号をつける
\setbeamertemplate{caption}{\raggedright\insertcaption\par}
\newtheorem{thm}{Theorem}

\newtheorem{proposition}{Proposition}
\newtheorem{dfn}[thm]{Definition}
\newtheorem*{dfn*}{}
\newtheorem{lem}[thm]{Lemma}
\theoremstyle{example}
\newtheorem{eg}[thm]{Example}
\newtheorem{remark}[thm]{Remark}
\newtheorem{question}[thm]{Question}
\newtheorem{prob}[thm]{Problem}
\newtheorem*{eg*}{}

\usepackage{color}


\setbeamertemplate{navigation symbols}{}

\usetheme{Madrid}
\usefonttheme{professionalfonts} 

\newcommand\Sha[1]{\ensuremath{\mathop{\text{\normalfont ш}}#1}}
