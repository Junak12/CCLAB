%option noyywrap

%{
// Roll Number: 1703xxx
#include <stdio.h>
%}

digit       [0-9]
id          [A-Za-z][a-zA-Z0-9]*
float       ([0-9]*\.[0-9]+([eE][-+]?[0-9]+)?|[0-9]+[eE][-+]?[0-9]+)
stringlit   \"([^\\\"]|\\.)*\"
charlit     \'([^\\\']|\\.)\'
delim       [ \t]

%%
"int"       { printf("%s -> INT\n", yytext); }
"float"     { printf("%s -> FLOAT\n", yytext); }
"double"    { printf("%s -> DOUBLE\n", yytext); }
"char"      { printf("%s -> CHAR\n", yytext); }
"for"       { printf("%s -> FOR\n", yytext); }

"="         { printf("%s -> ASSIGN\n", yytext); }
"<="        { printf("%s -> LESSTHANEQUAL\n", yytext); }
"++"        { printf("%s -> INCREMENT\n", yytext); }
"("         { printf("%s -> LEFTPAR\n", yytext); }
")"         { printf("%s -> RIGHTPAR\n", yytext); }
"{"         { printf("%s -> LEFTBRAC\n", yytext); }
"}"         { printf("%s -> RIGHTBRAC\n", yytext); }
","         { printf("%s -> COMMA\n", yytext); }
":"         { printf("%s -> COLON\n", yytext); }

{float}     { printf("%s -> FLOAT_LITERAL\n", yytext); }
{digit}+    { printf("%s -> INT_LITERAL\n", yytext); }
{stringlit} { printf("%s -> STRING_LITERAL\n", yytext); }
{charlit}   { printf("%s -> CHAR_LITERAL\n", yytext); }
{id}        { printf("%s -> IDENTIFIER\n", yytext); }

{delim}+   

%%

int main()
{
  yylex();
  return 0;
}
