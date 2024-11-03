\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[shui 自定义文档模板]

%基本设置

\LoadClass[UTF8,a4paper,
% fontset=windows,
openright,zihao=5]{ctexbook}
%其中winfonts解决某些不常用字无法正确显示的问题，其中openright与twoside的效果一样
%Linux下默认使用的字体有些生僻字无法正常显示

\RequirePackage[top=2.6cm,bottom=2.6cm,left=2.8cm,right=2.5cm]{geometry}
%页边距 其中的marginparsep(页边注与正文的间隔)是为了todonotes宏包的注释距离而重新设定,marginparwidth页注的宽度

\RequirePackage{xcolor}%定义了一些颜色

%超链接
\RequirePackage[draft=false,colorlinks=true,CJKbookmarks=true,linkcolor=black,citecolor=green,urlcolor=red,hyperindex]{hyperref}

\RequirePackage{enumerate} %列项序号编号
\RequirePackage{amssymb} %数学公式符号
\RequirePackage{amsmath} %数学公式
\RequirePackage{physics} %一些符号的简写
\RequirePackage{mathtools} %数学公式扩展宏包,提供了公式编号定制和更多的符号、矩阵等。
\RequirePackage{amsfonts} %用来输入各种符号的特殊形态，例如字母的花体、空心体等，配合amssymb使用
\RequirePackage{mathrsfs} %数学中的花体(不是太花的)
\RequirePackage{graphicx} %图片


\usepackage{bm}%粗斜体，印刷向量的时候用，使用\bm{}
\usepackage{esvect}%矢量加箭头，使用  \vec{a} 或者 \vv{a}
\usepackage{svg}


% 显示带圈数字符号
\xeCJKsetcharclass{`①}{`⑩}{1}


\newif\ifanswer %答案显示
\newif\ifnynoteshow %NIYANhhhhh的个人笔记显示



\usepackage{ascolorbox}%答案框
\usepackage{esint} % various fancy integral symbols %积分符号

\renewcommand{\labelenumi}{\chinese{enumi}、}
\renewcommand{\labelenumii}{(\arabic{enumii})}

\usepackage{witharrows}%公式推导注释
\usepackage{tabularray}%新型表格宏包，排版矩阵表格利器

\usepackage[upright=true]{derivative}%分数导数微分偏微分增量改变量等 

\usepackage{pifont}

\usepackage[normalem]{ulem}%下划线\uline{XXX}
\newcommand{\tk}[1]{
	\ifanswer
	\uline{~~#1~~}%
%\answxsim{
%\item
%#1
%}{}
	\else
	%\settowidth{\keylength}{~#1~}
	%\underline{\hspace{\keylength}}
    %\uline{\hspace{\keylength}}
%注意，此处不能使用\hspace{\keylength}进行填充(在刚好换行的时候会出问题)
\uline{\hbox to 2cm{}}%长度的问题。暂时没找到解决办法
    %\textcolor{red}{\ul{#1}}
	\fi}



%颜色的定义
\definecolor{mynote}{RGB}{255,134,24}%
\usepackage{manfnt}%其中的manfnt提供\textdbend的一个图形命令。包中还有很多图形命令
\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend~}
    \textbf{\color{mynote}笔记}~\kaishu}{\par}


%NIYANhhhhh's note
    \definecolor{ny_note}{RGB}{6, 150, 52}
    \definecolor{ny_note_text}{RGB}{118, 57, 18}
    \newcommand\nynote[1]{
        \ifanswer
        \ifnynoteshow
        \par\vspace{1mm}
        \noindent
        \textbf{\color{ny_note}NIYANhhhhh的笔记}\\
        {\kaishu \color{ny_note_text}{#1}}
        \par
        \else
        \fi
        \else
        \fi
    }


    
%页脚
\usepackage{fancyhdr}

\usepackage{lastpage}%统计总页数
\fancypagestyle{mypagestyle}{%
	\fancyhf{}% Clear header/footer

	%\fancyhead[O]{\protect\Headerodd}% Author on Odd page, Centred
	%\fancyhead[E]{\protect\Headereven}% Title on Even page, Centred
	\fancyfoot[OR]{第~\thepage~页，共~\pageref{LastPage}~页}%
	\fancyfoot[EL]{第~\thepage~页，共~\pageref{LastPage}~页}%
	\fancyfoot[OL]{科目名称：高等数学（甲）}%
	\fancyfoot[ER]{科目名称：高等数学（甲）}%
	%\renewcommand{\headrulewidth}{0pt}% Header rule of .4pt
	\renewcommand{\footrulewidth}{0.5pt}% Header rule of .4pt
}
\fancypagestyle{plain}{%
	\fancyhf{}% Clear header/footer
	\fancyfoot[OR]{第~\thepage~页，共~\pageref{LastPage}~页}%
	\fancyfoot[EL]{第~\thepage~页，共~\pageref{LastPage}~页}%
	\fancyfoot[OL]{科目名称：高等数学（甲）}%
	\fancyfoot[ER]{科目名称：高等数学（甲）}%
}

\newcommand{\bta}[1]{
    \setcounter{page}{1}%设置页面计数器
    %\pagestyle{mypagestyle}
    %\chapter{#1}
	%\chapter*{第\chinese{counter1}节 \qquad #1}
	\addcontentsline{toc}{chapter}{#1 高等数学甲}
	\chaptermark{#1 高等数学甲}
    %\renewcommand{\mypagenote}{#1}
	%\songti
	%\zihao{5}
%高等数学甲
\begin{center}
	\zihao{4}\heiti
	中国科学院大学\\
	#1 年招收攻读硕士学位研究生入学统一考试试题\\
	科目名称:高等数学（甲）

\end{center}
\noindent
考生须知：\\
1.本试卷满分为150分,全部考试时间总计180分钟。\\
2.所有答案必须写在答题纸上,写在试题纸上或草稿纸上一律无效。

\vspace*{2ex}
\hrule
\vspace*{4ex}

}


\newcommand{\xzanswer}[1]{%
\ifanswer
	  $ (~\textcolor{red!60!black}{#1}~) $
\else
      $ ( \quad ) $
\fi}



\newcommand{\banswer}[1]{%
\ifanswer
\begin{ascolorbox2}{}[colframe=gray!50!white, coltext=red!60!black,colback=gray!5!white,]
%\ascboxA{解}
\textcolor{red!80}{解：}
#1
\end{ascolorbox2}
    \vfill %垂直分列，自动划分大题的空白
\else
    \vfill %垂直分列，自动划分大题的空白
\fi}



%四个选项的处理
\usepackage{xstring,xifthen}
\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\choicelengthe}
\newlength{\maxlength}
\newcommand{\fourchoices}[4]
{
	\settowidth{\choicelengtha}{A.~#1~}
	\settowidth{\choicelengthb}{B.~#2~}
	\settowidth{\choicelengthc}{C.~#3~}
	\settowidth{\choicelengthd}{D.~#4~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.49\linewidth}}%万事留一线(防止意外)
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#3\strut}%
\\
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#4\strut}%
%\vspace{\parskip}
\par
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.24\linewidth}}%万事留一线(防止意外)
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#2}
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#3}\hfill%
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\strut\raggedright%
	#4\strut}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#2}\hfill%
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#3}\hfill%
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\strut\raggedright%
	#4\strut}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
	}
}



%对与四个选项为图像时进行特殊处理

\newcommand{\pfourchoices}[4]
{
	\settowidth{\choicelengtha}{A.~#1~}
	\settowidth{\choicelengthb}{B.~#2~}
	\settowidth{\choicelengthc}{C.~#3~}
	\settowidth{\choicelengthd}{D.~#4~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.49\linewidth}}%万事留一线(防止意外)
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#3\strut}%
\\
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#4\strut}%
%\vspace{\parskip}
\par
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.24\linewidth}}%万事留一线(防止意外)
		{
\par
\noindent
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#1\par
 	A.\vspace{1.5em}
\end{minipage}
 \hfill
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#2\par
 	B.\vspace{1.5em}
 \end{minipage}
\\
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#3\par
 	C.\vspace{0.9em}
\end{minipage}
 \hfil
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#4\par
 	D.\vspace{0.9em}
 \end{minipage}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
		{
\par
\noindent
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#1\par
 	A.\vspace{0.9em}
 \end{minipage}
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#2\par
 	B.\vspace{0.9em}
 \end{minipage}
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#3\par
 	C.\vspace{0.9em}
 \end{minipage}
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#4\par
 	D.\vspace{0.9em}
 \end{minipage}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
	}
}


%对选择题的三个选项处理
\newlength{\threechoicelengtha}
\newlength{\threechoicelengthb}
\newlength{\threechoicelengthc}
\newlength{\threemaxlength}
\newcommand{\threechoices}[3]
{
	\settowidth{\threechoicelengtha}{A.~#1~}
	\settowidth{\threechoicelengthb}{B.~#2~}
	\settowidth{\threechoicelengthc}{C.~#3~}
	\ifthenelse{\lengthtest{\threechoicelengtha>\threechoicelengthb}}{\setlength{\threemaxlength}{\threechoicelengtha}}{\setlength{\threemaxlength}{\threechoicelengthb}}
	\ifthenelse{\lengthtest{\threechoicelengthc>\threemaxlength}}{\setlength{\threemaxlength}{\threechoicelengthc}}{}
	\ifthenelse{\lengthtest{\threemaxlength>0.49\linewidth}}
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#3\strut}%
%\vspace{\parskip}
\par
	}
	{
		\ifthenelse{\lengthtest{\threemaxlength>0.24\linewidth}}
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#2}
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\strut\raggedright%
	#3\strut}\hfill%
%\vspace{\parskip}
\par
		}
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#1}%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#2}%
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\strut\raggedright%
	#3\strut}\hfill%
%\vspace{\parskip}
\par
		}
	}
}



