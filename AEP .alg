algoritmo "Projeto AEP"

var
setalunos:vetor[1..10]de caracter
setcpf:vetor[1..5]de caracter
setpass:vetor[1..5]de caracter
setschool:vetor[1..2]de caracter
medianotas:vetor[1..10]de real
aus:vetor[1..10]de inteiro
ausen:vetor[1..10]de inteiro
tmpmail:vetor[1..30]de caracter
setinicio:inteiro
contp,z,contm,f:inteiro
menu1,menu2,menu3,menu4,menu5,existea:logico
esc:inteiro
disc:inteiro
md:inteiro
matd:inteiro
rel:inteiro
rltind:inteiro
sair:caracter

//--------------------------------Apresentacao----------------------------------------
procedimento apresentacao
inicio
escreval("   Neste algorismo demonstraremos como seria o funcionamento de um aplicativo,")
escreval("   voltado para apoio dos professores para com as aulas e os alunos.")
escreval
escreval("     *Solicitar Cadastro e armazenar dados de cadastro")
escreval("     *Solicitar Login e validar mesmo")
escreval("     *Solicitar notas e gerar Matriz com as notas de cada aluno")
escreval("     *Solicitar mat�ria do dia e armazenar informa��es da mat�ria")
escreval("     *Solicitar chamada e mostrar quantidade de faltas de cada aluno")
escreval(" ")
escreva("--> Pressione ENTER para continuar... ")
leia(sair)
limpatela
fimprocedimento
//------------------------------------DADOS-------------------------------------
procedimento down_dados
var
inicio
setalunos[1]:="ALBERT FLORES"
setalunos[2]:="ANNETTE BLACK"
setalunos[3]:="ARLENE MCCOY"
setalunos[4]:="BESSIE COOPER"
setalunos[5]:="CODY FISHER"
setalunos[6]:="DEVON LANE"
setalunos[7]:="DIANNE RUSSELL"
setalunos[8]:="FLOYD MILES"
setalunos[9]:="GUY HAWKINS"
setalunos[10]:="JACOB JONES"
limpatela
fimprocedimento
//----------------------------------------------------------------------------------------------
procedimento topo
inicio
escreval()
escreval("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
escreval("*  ___________________________________________________________________________  *")
escreval("* |                                                                           | *")
escreval("* |                                 BEM VINDO                                 | *")
escreval("* |                          REGISTRO DE CLASSE ONLINE                        | *")
escreval("* |___________________________________________________________________________| *")
escreval("*                                                                               *")
escreval("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
fimprocedimento
//----------------------------------------------------------------------------------------------
procedimento exit
inicio
escreval()
escreval("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
escreval("*  ___________________________________________________________________________  *")
escreval("* |                                                                           | *")
escreval("* |                    VOC� SAIU DO REGISTRO DE CLASSE                        | *")
escreval("* |___________________________________________________________________________| *")
escreval("*                                                                               *")
escreval("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
escreval()
fimprocedimento

//---------------------------Login ou Cadastro------------------------
procedimento login_cadastro(VAR lc:inteiro)
inicio
lc:=0
repita
   escreval()
   escreval("                             * * * * * * * * * *        ")
   escreval("                             * [1] Cadastro    *        ")
   escreval("                             * [2] Login       *        ")
   escreval("                             * [0] Sair        *        ")
   escreval("                             * * * * * * * * * *        ")
   escreval()
   escreva("----> Escolhar umas das op��es acima(1 , 2 ou 0): ")
   leia(lc)
   escreval()
   se (lc<>1) e (lc<>2) e (lc<>0)entao
      escreva("Valor inv�lido. Digite novamente!")
      escreval()
   fimse
ate (lc=1) ou (lc=2) ou (lc=0)
fimprocedimento

//------------------------------Cadastro------------------------------
procedimento cadastro
var
nome,email,checksenha:caracter
x:inteiro
inicio
x:=1
contm:=0
existea:=falso
escreval()
escreval("                    _____________________________________                        ")
escreval("                   |                                     |                       ")
escreval("                   |               CADASTRO              |                       ")
escreval("                   |_____________________________________|                       ")
escreval()
escreval()
escreva("----> Nome completo: ")
leia(nome)
repita
   escreva("----> Email: ")
   leia(email)
   para x de 1 ate compr(email)faca
      tmpmail[x]:=copia(email,x,1)
   fimpara
   contm:=compr(email)
   existea:=valida_mail("@",".")
ate (existea=verdadeiro)
escreva("----> CPF: ")
leia(setcpf[contp])
escreva("----> Senha: ")
leia(setpass[contp])
repita
   escreva("----> Confime Senha: ")
   leia(checksenha)
   se setpass[contp]<>checksenha entao
      escreval("Senhas n�o conferem!!")
   fimse
ate setpass[contp]=checksenha
escreval
contp:=contp+1
fimprocedimento
//----------------validamail-----------
funcao valida_mail(o , t:caracter):logico
var
fim,pont,meio,p:inteiro
existe:logico
inicio
pont:=0
meio:=1
p:=0
fim:=contm
nao existe
enquanto (meio<=fim)e(pont=0) faca
   se (tmpmail[meio]=o)entao
      pont:=meio
   fimse
   meio:=meio+1
fimenquanto
meio:=1
enquanto (meio<=fim)e(p=0) faca
   se (tmpmail[meio]=t)entao
      p:=meio
   fimse
   meio:=meio+1
fimenquanto
se (pont=0) e (p=0) entao
   nao existe
senao
   se pont>p entao
      nao existe
   senao
      existe:=verdadeiro
   fimse
fimse
retorne existe
fimfuncao

//-------------------------------Login---------------------------------------
procedimento login
var
cpf,senha:caracter
x:inteiro
inicio
x:=1
escreval()
escreval("                    _____________________________________                        ")
escreval("                   |                                     |                       ")
escreval("                   |                LOGIN                |                       ")
escreval("                   |_____________________________________|                       ")
escreval()
escreval()
repita
   escreva("----> CPF: ")
   leia(cpf)
   se (cpf<>"123")e(cpf<>setcpf[1])e(cpf<>setcpf[2]) entao
      escreval("Cpf Invalido! Digite novamente")
      escreval()
   fimse
ate (cpf="123")ou(cpf=setcpf[1])ou(cpf=setcpf[2])
repita
   escreva("----> Senha: ")
   leia(senha)
   se (senha<>"123")e(senha<>setpass[1])e(senha<>setpass[2]) entao
      escreval("Senha incorreta! Digite novamente")
      escreval()
   fimse
ate (senha="123")ou(senha=setpass[1])ou(senha=setpass[2])
fimprocedimento
//-----------------------------------Escolas------------------------------------
procedimento escolas (VAR x:inteiro)
inicio
escreval()
escreval("                             * * * * * * * * * * ")
escreval("                             * [1] ESCOLA 1    * ")
escreval("                             * [2] ESCOLA 2    * ")
escreval("                             * [0] Voltar      * ")
escreval("                             * * * * * * * * * * ")
escreval()
escreval("                     Qual Col�gio deseja atendimento: 1 , 2 ou 0.. ")
escreval()
leia(x)
se x<>0 entao
   x:=1
fimse
limpatela
fimprocedimento
//---------------------------------Disciplina-----------------------------------
procedimento disciplina (VAR x:inteiro)
inicio
escreval()
escreval("                            * * * * * * * * * * * ")
escreval("                            * [1] DISCIPLINA 1  * ")
escreval("                            * [2] DISCIPLINA 2  * ")
escreval("                            * [3] DISCIPLINA 3  * ")
escreval("                            * [0] Voltar        * ")
escreval("                            * * * * * * * * * * * ")
escreval()
escreval("                     Qual Disciplina deseja acessar: 1 , 2 , 3 ou 0.. ")
escreval()
leia(x)
se x<>0 entao
   x:=1
fimse
fimprocedimento
//------------------------------Menu de Disciplina------------------------------
procedimento menu_disc(VAR x:inteiro)
inicio
escreval()
escreval("                         * * * * * * * * * * * * * * * ")
escreval("                         * [1] MAT�RIA DO DIA        * ")
escreval("                         * [2] NOTAS                 * ")
escreval("                         * [3] FREQU�NCIA            * ")
escreval("                         * [4] RELAT�RIOS            * ")
escreval("                         * [0] Voltar                * ")
escreval("                         * * * * * * * * * * * * * * * ")
escreval()
escreval("                     Selecione a op��o: 1 , 2 , 3 , 4 ou 0.. ")
escreval()
leia(x)
fimprocedimento
//------------------------------Materia do dia----------------------------------
procedimento mat_dia(VAR x:inteiro)
inicio
escreval()
escreval("                     _____________________________________                       ")
escreval("                    |                                     |                      ")
escreval("                    |            MATERIA DO DIA           |                      ")
escreval("                    |_____________________________________|                      ")
escreval()
escreval()
escreval("      |-----------------------------------------------------------------|")
escreval("      | 28/06/2021      |           AULA 1           |             [1]  |")
escreval("      |-----------------------------------------------------------------|")
escreval("      | 27/06/2021      |           AULA 2           |             [2]  |")
escreval("      |-----------------------------------------------------------------|")
escreval("      | 21/06/2021      |           AULA 3           |             [3]  |")
escreval("      |-----------------------------------------------------------------|")
escreval("      | 20/06/2021      |           AULA 4           |             [4]  |")
escreval("      |-----------------------------------------------------------------|")
escreval("      | 14/06/2021      |           AULA 5           |             [5]  |")
escreval("      |-----------------------------------------------------------------|")
escreval("      | 13/06/2021      |           AULA 6           |             [6]  |")
escreval("      |-----------------------------------------------------------------|")
escreval("      |                                                     Voltar [0]  |")
escreval("      |-----------------------------------------------------------------|")
escreval()
escreval()
escreval("        Selecione a aula que deseja postar mat�ria: 1 , 2 , 3 , 4 ou 0.. ")
leia(x)
se x<>0 entao
   x:=1
fimse
limpatela
fimprocedimento
//--------------------------------inside materia--------------------------------
procedimento inside_mat
var
arq,data,path:caracter
inicio
escreval()
escreval("                    _____________________________________                        ")
escreval("                   |                                     |                       ")
escreval("                   |                 AULA                |                       ")
escreval("                   |_____________________________________|                       ")
escreval()
escreval()
escreva("Digite o nome do arquivo que deseja salvar: ")
leia(arq)
escreva("Digita a data de hoje: ")
leia(data)
escreva("Coloque o caminho que est� o arquivo(C:\Users\Public\Documents): ")
leia(path)
fimprocedimento
//-----------------------------------Notas--------------------------------------
procedimento notas(VAR media:real)
var
nts:vetor[1..4]de real
x:inteiro
inicio
escreval()
escreval("                   |-------------------------------------|                       ")
escreval("                   |            ",setalunos[z]:15,"          |                       ")
escreval("                   |-------------------------------------|                       ")
escreval()
para x de 1 ate 4 faca
   repita
      escreva("Digite a nota do ",x,"�BI: ")
      leia(nts[x])
   ate (nts[x]>=0) e (nts[x]<=100)
fimpara
media:=(nts[1]+nts[2]+nts[3]+nts[4])/4
escreval()
fimprocedimento
//--------------------------------Frequencias-----------------------------------
procedimento freq (VAR x:inteiro)
var
presenca:caracter
k:inteiro
inicio
topo
x:=0
escreval()
escreval("                   |-------------------------------------|                       ")
escreval("                   |            ",setalunos[z]:15,"          |                       ")
escreval("                   |-------------------------------------|                       ")
escreval()
para k de 1 ate 2 faca
   repita
      escreva("Aluno esteve presente na aula ",k,": ")
      leia(presenca)
   ate (presenca="sim") ou (presenca="nao")
   se presenca="nao" entao
      x:=x+1
   senao
      x:=x
   fimse
fimpara
ausen[f]:=x
f:=f+1
limpatela
fimprocedimento
//---------------------------------Exibe notas----------------------------------
procedimento exibir_notas
var
aprov:caracter
inicio
escreval()
escreval("                    _____________________________________                        ")
escreval("                   |                                     |                       ")
escreval("                   |               ALUNOS                |                       ")
escreval("                   |_____________________________________|                       ")
escreval()
escreval()
para z de 1 ate 10 faca
   se medianotas[z]>=60 entao
      aprov:="APROVADO"
   senao
      aprov:="REPROVADO"
   fimse
   escreval(" |-------------------------------------------------------------------------|")
   timer(200)
   escreval(" | ",setalunos[z]:15,"      |           ",medianotas[z]:4,"           |           ",aprov:10,"  |")
   timer(0)
fimpara
escreval(" |-------------------------------------------------------------------------|")
timer(1000)
timer(0)
fimprocedimento
//----------------------------Relatoria individual------------------------------
procedimento relat (VAR x:inteiro)
var
rlt:caracter
inicio
escreval()
escreval("                    _____________________________________                        ")
escreval("                   |                                     |                       ")
escreval("                   |              RELAT�RIOS             |                       ")
escreval("                   |_____________________________________|                       ")
escreval()
escreval()
repita
   escreval("Deseja fazer relat�rio dos alunos individual ou da turma? ")
   leia(rlt)
ate (rlt="individual") ou (rlt="turma")
se rlt="individual" entao
   x:=0
senao
   x:=1
fimse
escreval()
fimprocedimento
//--------------------------------RELAT INDIV-----------------------------------
procedimento relat_indiv(VAR x:inteiro)
inicio
escreval()
escreval("                    _____________________________________                        ")
escreval("                   |                                     |                       ")
escreval("                   |               ALUNOS                |                       ")
escreval("                   |_____________________________________|                       ")
escreval()
escreval()
escreval("                      |-------------------------------|")
escreval("                      |    ALBERT FLORES         [1]  |")
escreval("                      |-------------------------------|")
escreval("                      |    ANNETTE BLACK         [2]  |")
escreval("                      |-------------------------------|")
escreval("                      |    ARLENE MCCOY          [3]  |")
escreval("                      |-------------------------------|")
escreval("                      |    BESSIE COOPER         [4]  |")
escreval("                      |-------------------------------|")
escreval("                      |    CODY FISHER           [5]  |")
escreval("                      |-------------------------------|")
escreval("                      |    DEVON LANE            [6]  |")
escreval("                      |-------------------------------|")
escreval("                      |    DIANNE RUSSELL        [7]  |")
escreval("                      |-------------------------------|")
escreval("                      |    FLOYD MILES           [8]  |")
escreval("                      |-------------------------------|")
escreval("                      |    GUY HAWKINS           [9]  |")
escreval("                      |-------------------------------|")
escreval("                      |    JACOB JONES          [10]  |")
escreval("                      |-------------------------------|")
escreval("                      |                   Voltar [0]  |")
escreval("                      |-------------------------------|")
escreval()
escreval()
escreval("       Selecione o aluno correspondente: 1,2, .. ,10 ou 0.")
leia(x)
se x<>0 entao
   x:=1
fimse
fimprocedimento
//---------------------------Show Relatorio indiv-------------------------------
procedimento show_relat_ind
var
c:caracter
inicio
limpatela
escreval()
topo
escreval()
escreval("Digite o coment�rio a respeito do aluno: ")
leia(c)
fimprocedimento
//--------------------------------RELAT TURMA-----------------------------------
procedimento relat_turma
var
c:caracter
inicio
limpatela
escreval()
topo
escreval()
escreval("Digite os comentarios da turma: ")
leia(c)
fimprocedimento
//-------------------------------Processamento----------------------------------
procedimento processamento
inicio
contp:=1
repita
   topo
   login_cadastro(setinicio)
   limpatela
   escolha setinicio
   caso 1
      topo
      cadastro
      Limpatela
      nao menu1
   caso 2
      topo
      login
      limpatela
      repita
         topo
         escolas(esc)
         escolha esc
         caso 1
            limpatela
            repita
               topo
               disciplina(disc)
               limpatela
               escolha disc
               caso 1
                  repita
                     topo
                     menu_disc(md)
                     limpatela
                     escolha md
                     caso 1
                        repita
                           topo
                           mat_dia(matd)
                           limpatela
                           escolha matd
                           caso 1
                              topo
                              inside_mat
                              menu5:=falso
                           caso 0
                              menu5:=verdadeiro
                           fimescolha
                        ate menu5=verdadeiro
                        menu4:=falso
                     caso 2
                        topo
                        para z de 1 ate 10 faca
                           notas(medianotas[z])
                        fimpara
                        escreval()
                        exibir_notas
                        limpatela
                        menu4:=falso
                     caso 3
                        topo
                        limpatela
                        f:=1
                        para z de 1 ate 10 faca
                           freq(aus[z])
                        fimpara
                        topo
                        escreval()
                        para z de 1 ate 10 faca
                           timer(200)
                           escreval("Aluno: ",setalunos[z]:15," teve faltas: ",aus[z]:4)
                           timer(0)
                           escreval()
                        fimpara
                        timer(1000)
                        timer(0)
                        limpatela
                        menu4:=falso
                     caso 4
                        topo
                        relat(rel)
                        se rel=0 entao
                           relat_indiv(rltind)
                           se rltind=1 entao
                              limpatela
                              topo
                              show_relat_ind
                           fimse
                        senao
                           relat_turma
                        fimse
                        limpatela
                        menu4:=falso
                     caso 0
                        menu4:=verdadeiro
                     fimescolha
                  ate menu4=verdadeiro
                  menu3:=falso
                  limpatela
               caso 0
                  menu3:=verdadeiro
               fimescolha
            ate menu3=verdadeiro
            menu2:=falso
            limpatela
         caso 0
            limpatela
            menu2:=verdadeiro
         fimescolha
         limpatela
      ate menu2=verdadeiro
      nao menu1
   caso 0
      menu1:=verdadeiro
      limpatela
   fimescolha
ate menu1=verdadeiro
fimprocedimento

//-----------------------------Inicio do Programa-------------------------------
inicio
down_dados
apresentacao
processamento
limpatela
exit
fimalgoritmo
