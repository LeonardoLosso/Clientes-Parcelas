algoritmo "semnome"
var
   codigoC,codigoP, parcela, dataven, datapag, parvalor, banco , nome, cidade, uf, lixo, cpf:vetor [1..200] de caractere
   linha,pesq, bnk:caractere
   C, j, i, Col:inteiro
   DataC, K: caractere
//=============================================LE CAMPO DOS TXT=================
funcao LeCampo(var p:inteiro):caractere
var
   r,car:caractere
   
inicio
      R<-""
      car<-copia(linha, p, 1)
      enquanto asc(car) <> 34 faca
               r<-r+car
               p<-p+1
               car<-copia(linha, p, 1)
      fimenquanto
      p<-p+3
      retorne R
fimfuncao
//=============================================DATA DE HOJE=====================
procedimento DataHoje
var
   dia, mes, ano:caractere
inicio
      repita
            escreval("==============================")
            escreval("Qual o dia de hoje ?(dd/mm/aa)")
            escreval("==============================")
            escreva(" DIA ")
            leia (dia)
            escreva(" MES ")
            leia (mes)
            escreva(" ANO ")
            leia(ano)
            K<-(ano)+(mes)+(dia)
            dataC<-dia+"/"+mes+"/"+ano
            limpatela
            se (compr(k)<>6)entao
               escreval("Tente outra data")
            fimse
      ate (compr(K)=6)
fimprocedimento
//=============================================LE CADASTRO DOS CLIENTES=========
procedimento LeCliente
arquivo "clientes.txt"
var
   I:inteiro
inicio
      para C de 1 ate 147 faca
           leia(linha)
           col<-2
           //CÓDIGO CLIENTE
           codigoC[C]<-LeCampo(col)
           //NOME
           nome[C]<-LeCampo(col)
           //CIDADE
           cidade[C]<-LeCampo(col)
           //ESTADO
           uf[C]<-Lecampo(col)
           //LIXO 3x
           I<-0
           repita
                 lixo[C]<-Lecampo(col)
                 I<-I+1
           ate I=3
           //CNPJ
           cpf[c]<-LeCampo(col)
           
      fimpara
fimprocedimento
//=============================================LE PARCELAS DOS CLIENTES=========
procedimento LeParcela
arquivo "parcelas.txt"
var
   I:inteiro
inicio
      para C de 1 ate 76 faca
           leia(linha)
           col<-2
           //PARCELA
           parcela[c]<-LeCampo(col)
           //CODIGO CLIENTE
           codigop[c]<-LeCampo(col)
           //DATA VENCIMENTO
           dataven[c]<-LeCampo(col)
           //DATA DE PAGAMENTO
           datapag[c]<-LeCampo(col)
           //VALOR PARCELA
           parvalor[c]<-LeCampo(col)
           //BANCO
           banco[c]<-LeCampo(col)
      fimpara
fimprocedimento
//=============================================ESCOLHE O CODIGO DO BANCO========
funcao EscolheBanco (var banco:caractere):caractere
var
x:caractere
OP:inteiro
inicio
      limpatela
      repita
            escreval("=============================")
            escreval("[1] - Banco do Brasil")
            escreval("[2] - Caixa Economica Federal")
            escreval("[3] - Bradesco")
            escreval("[4] - Nubank")
            escreval("[5] - Carteira")
            escreval("=============================")
            leia (OP)
            escolha(OP)
                 caso 1
                      X<-"001"
                      banco<-"    Banco do Brasil    "
                 caso 2
                      X<-"104"
                      banco<-"Caixa Economica Federal"
                 caso 3
                      x<-"237"
                      banco<-"       Bradesco        "
                 caso 4
                      x<-"260"
                      banco<- "        Nubank        "
                 caso 5
                      x<-"0"
                      banco<-"        Carteira       "
            fimescolha
            limpatela
            se (OP<1) ou (OP>5) entao
               escreval("Opção inválida")
               escreval()
            fimse
      ate (OP<6) e (OP>0)
      retorne x
fimfuncao
//=============================================verificar codigo=================
funcao verificacod(codigo:caractere):logico
var
   x:inteiro
   prossiga:logico
inicio
      para x de 1 ate 200 faca
           se codigoc[x]=codigo entao
              prossiga<-verdadeiro
           fimse
      fimpara
      retorne prossiga
fimfuncao
//=============================================MENU BANCO=======================
procedimento MenuBanco()
var
   escolher:inteiro
   tot:real
   voltar:caractere
inicio
//MENU BANCO--------------------------------------------------------------------
      limpatela
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==            Receitas           == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Receitas em aberto")
            escreval("[2] - Receitas recebidas")
            escreval("[3] - Receitas geral")
            escreval("[4] - Receitas atrasadas")
            escreval("[0] - Voltar para o menu principal")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>4) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=4) e (escolher>=0)
      se (escolher=0) entao
         MenuPrincipal
      fimse
//MENU EM ABERTO----------------------------------------------------------------
      limpatela
      se (escolher=1) entao
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==       Receitas em aberto      == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Pesquisar por banco")
            escreval("[2] - Total em aberto")
            escreval("[0] - Voltar")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>2) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=2) e (escolher>=0)
            se (escolher=0) entao
               limpatela
               MenuBanco
            fimse
            //BANCO A BANCO
            se (escolher=1) entao
               pesq<-escolhebanco(bnk)
               escreval()
               escreval("=======================")
               escreval(bnk)
               escreval("=======================")
               escreval ("cód.parcela":12,"|","cód.cliente":12,"|"," Data venc.":12,"|"," Valor":12)
               escreval ("---------------------------------------------------")
               para c<-1 ate 200 faca
                    se (pesq=banco[c]) e (datapag[c]="") entao
                       escreval("   ",parcela[c]:12, codigoP[c]:12, dataven[c]:12, "R$ ", parvalor[c])
                       tot<-tot+caracpnum(parvalor[c])
                    fimse
               fimpara
               escreval("=================================================")
               escreval()
               escreval("O total de receitas em aberto R$ ", tot)
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
               leia(voltar)
               se (voltar="") entao
                  MenuBanco
               fimse
            fimse
            limpatela
            //TOTAL ABERTO
            se (escolher=2) entao
               Para C de 1 ate 200 faca
                    se (datapag[c]="")  entao
                       tot<-tot+caracpnum(parvalor[c])
                    fimse
               fimpara
               escreval()
               escreval("O Total em Aberto de todos os bancos é R$ ", tot)
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
               leia(voltar)
               se (voltar="") entao
                  MenuBanco
               fimse
            fimse
      fimse
//TOTAL PAGO--------------------------------------------------------------------
      limpatela
      se (escolher=2) entao
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==       Receitas recebidas      == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Pesquisar por banco")
            escreval("[2] - Total recebido")
            escreval("[0] - Voltar")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>2) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=2) e (escolher>=0)
            se (escolher=0) entao
               limpatela
               MenuBanco
            fimse
            //BANCO A BANCO
            se (escolher=1) entao
               pesq<-escolhebanco(bnk)
               escreval()
               escreval("=======================")
               escreval(bnk)
               escreval("=======================")
               escreval ("cód.parcela":12,"|","cód.cliente":12,"|","Data Pag. ":12,"|"," Valor":12)
               escreval ("---------------------------------------------------")
               para c<-1 ate 200 faca
                    se (pesq=banco[c])e (datapag[c]<>"") entao
                       escreval("  ",parcela[c]:12, codigoP[c]:12, datapag[c]:12, "R$ ", parvalor[c])
                       tot<-tot+caracpnum(parvalor[c])
                    fimse
               fimpara
               escreval("==================================================")
               escreval()
               escreval("O total de receitas recebidas R$ ", tot)
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
               leia(voltar)
               se (voltar="") entao
                  MenuBanco
               fimse
            fimse
            //TOTAL RECEBIDO
            limpatela
            se (escolher=2) entao
               Para C de 1 ate 200 faca
                    se (datapag[c]<>"") entao
                       tot<-tot+caracpnum(parvalor[c])
                    fimse
               fimpara
               escreval()
               escreval("O Total recebido de todos os bancos é R$ ", tot)
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
               leia(voltar)
               se (voltar="") entao
                  MenuBanco
               fimse
            fimse
      fimse
//MENU TOTAL GERAL--------------------------------------------------------------
      limpatela
      se (escolher=3) entao
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==        Receitas totais        == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Pesquisar por banco")
            escreval("[2] - Total geral")
            escreval("[0] - Voltar")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>2) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=2) e (escolher>=0)
            se (escolher=0) entao
               limpatela
               MenuBanco
            fimse
            //BANCO A BANCO
            se (escolher=1) entao
               pesq<-escolhebanco(bnk)
               escreval()
               escreval("=======================")
               escreval(bnk)
               escreval("=======================")
               escreval ("cód.parcela":12,"|","cód.cliente":12,"|"," Data venc.":12,"|","Data Pag. ":12,"|"," Valor":12)
               escreval ("-------------------------------------------------------------")
               para c<-1 ate 200 faca
                    se (pesq=banco[c]) entao
                       escreval("   ",parcela[c]:12, codigoP[c]:12, dataven[c]:12, datapag[c]:12, "R$ ", parvalor[c])
                       tot<-tot+caracpnum(parvalor[c])
                    fimse
               fimpara
               escreval("==============================================================")
               escreval()
               escreval("O total de receitas em totais R$ ", tot)
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
               leia(voltar)
               se (voltar="") entao
                  MenuBanco
               fimse
            fimse
            limpatela
            //TOTAL GERAL
            se (escolher=2) entao
               Para C de 1 ate 200 faca
                    tot<-tot+caracpnum(parvalor[c])
               fimpara
               escreval()
               escreval ("O Total geral de todos os bancos é R$ ", tot)
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
               leia(voltar)
               se (voltar="") entao
                  MenuBanco
               fimse
            fimse
      fimse
//MENU TOTAL ATRASADO-----------------------------------------------------------
      se (escolher=4) entao
         DataVencimento
         escreval()
         escreval("=============================================")
         escreval("Para voltar ao Menu RECEITAS pressione 'ENTER'")
         leia(voltar)
         limpatela
         menubanco
      fimse
fimprocedimento
//=================================================MENU PARCELA=================
procedimento menuparcela
var
   escolher, OP, i:inteiro
   aux, voltar, temp, temp2:caracter
   existe:logico
inicio
   //MENU PRINCIPAL=============================================================
   c<-1
   repita
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== == == ==         Menu de parcelas      == == == ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("[1] - Incluir uma parcela")
      escreval("[2] - Modificar uma parcela")
      escreval("[3] - Excluir uma parcela")
      escreval("[0] - Voltar para o menu principal")
      escreval("== == == == == == == == == == == == == == == == == ==")
      leia (escolher)
      se escolher > 3 entao
         limpatela
         escreval("")
         escreval("Opção inválida")
         escreval("")
      fimse
      se escolher < 0 entao
         limpatela
         escreval("")
         escreval("Opção inválida")
         escreval("")
      fimse
   ate (escolher<4) e (escolher>=0)

   //INCLUIR UMA PARCELA========================================================
   se escolher = 1 entao
      limpatela
      enquanto (parcela[c]) <> "" faca
         c:=c+1
      fimenquanto
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== Informe os dados da parcela que deseja incluir: ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      se (parcela[c]) = "" entao
         escreva("Informe o numero da parcela de 7 digitos incluindo a '/': ")
         repita
               leia (temp)
               se (compr(temp)<>7) entao
                    limpatela
                    escreval ("O numero da parcela deve ter 7 digitos")
                    escreval()
                    escreval("Por favor tente novamente")
               fimse
               para i<- 1 ate 200 faca
                    se (parcela[i] = temp) entao
                       limpatela
                       escreval ("A parcela ", temp, " já existe")
                       escreval ("Por favor tente novamente")
                       temp2<-temp
                    fimse
               fimpara
         ate (compr(temp)=7) e (temp2<>temp)
         limpatela
         parcela[c]<-temp
         escreva("Informe o código do cliente de 4 digitos: ")
         repita
               leia(temp)
               existe<-verificacod(temp)
               se (existe=falso) entao
               limpatela
                  escreval ("Código ", temp, " não encontrado")
                  escreval ("Por favor insira um código de cliente cadastrado")
               fimse
         ate (existe=verdadeiro)
         codigop[c]<-temp
         limpatela
         escreva("Informe o valor da parcela: ")
         leia (parvalor[c])
         escreva("Informe a data de vencimento da parcela (dd/mm/aa): ")
         repita
               leia (temp)
               se (compr(temp)<>8) entao
                  limpatela
                  escreval ("O campo data deve ter 10 caracteres incluindo '/'")
                  escreval ("Por favor tente novamente")
               fimse
         ate (compr(temp)=10)
         dataven[c]<-temp
         escreva("Informe o código bancário da parcela: ")
         banco[c]:=EscolheBanco(bnk)
         limpatela
         escreval("==========================================")
         escreval("Parcela criada com sucesso")
               escreval()
               escreval("=============================================")
               escreval("Para voltar ao Menu PARCELAS precione 'ENTER'")
               leia(voltar)
               MenuParcela
      fimse
   fimse

   //MODIFICAR UMA PARCELA======================================================
   se escolher = 2 entao
      limpatela
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== Informe o código da parcela que deseja alterar: ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      leia (aux)
      enquanto aux <> (parcela[c]) faca
         c:=c+1
         Se c = 201 entao
            limpatela
            escreval("")
            escreval("Código não encontrado")
            escreval("")
            menuparcela
         fimse
      fimenquanto
      repita
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("== == == == ==  O que deseja alterar?  == == == == ==")
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("[1] - Valor da parcela")
         escreval("[2] - Data de vencimento")
         escreval("[0] - Voltar ao menu")
         escreval("== == == == == == == == == == == == == == == == == ==")
         leia (escolher)
         se escolher = 0 entao
            menuparcela
         fimse
         se escolher = 1 entao
            escreva("Informe o novo valor:")
            leia (parvalor[c])
            limpatela
            escreval("Operação realizada com sucesso!")
            escreval()
            escreval("=============================================")
            escreval("Para voltar ao Menu PARCELAS precione 'ENTER'")
            leia(voltar)
            limpatela
            MenuParcela
         fimse
         se escolher = 2 entao
            escreva("Informe a nova data de vencimento:")
            repita
                  leia (temp)
                  se (compr(temp)<>10) entao
                     limpatela
                     escreval ("O campo data deve ter 10 caracteres incluindo '/'")
                     escreval ("Por favor tente novamente")
                  fimse
            ate (compr(temp)=10)
            dataven[c]<-temp
            limpatela
            escreval("Operação realizada com sucesso!")
            escreval()
            escreval("=============================================")
            escreval("Para voltar ao Menu PARCELAS precione 'ENTER'")
            leia(voltar)
            limpatela
            MenuParcela
         fimse
         se escolher > 2 entao
            limpatela
            escreval("")
            escreval("Opção inválida")
            escreval("")
         fimse
         se escolher < 0 entao
            limpatela
            escreval("")
            escreval("Opção inválida")
            escreval("")
         fimse
      ate (escolher = 1) ou (escolher = 2) ou (escolher = 0)

   fimse

   //EXCLUIR UMA PARCELA========================================================
   se escolher = 3 entao
      limpatela
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== Informe o código da parcela que deseja excluir: ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      leia (aux)
      enquanto aux <> (parcela[c]) faca
         c:=c+1
         Se c = 201 entao
            limpatela
            escreval("")
            escreval("Código não encontrado")
            escreval("")
            menuparcela
         fimse
      fimenquanto
      limpatela
      repita
         escreval("O código de parcela selecionado foi:", aux)
         escreval("")
         escreval("Tem certeza que deseja excluir essa parcela?")
         escreval (maiusc("essa ação será irreversível"))
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("[1] - Sim")
         escreval("[2] - Não")
         leia (OP)
      caso 1
         banco[c] := ("")
         codigoP[c] := ("")
         parcela[c] := ("")
         dataven[c] := ("")
         datapag[c] := ("")
         parvalor[c] := ("")
         limpatela
         escreval("Operação realizada com sucesso!")
         escreval()
         escreval("=============================================")
         escreval("Para voltar ao Menu PARCELAS precione 'ENTER'")
         leia(voltar)
         limpatela
         menuparcela
      caso 2
         limpatela
         menuparcela
      fimescolha
   outrocaso
      limpatela
      escreval("")
      escreval("Opção inválida")
      escreval("")
   ate (OP = 1) ou (OP = 2)
fimse
fimprocedimento
//=======================================================ATRASADOS==============
procedimento DataVencimento
var
   tmp, pesq, voltar:caractere
   l, escolher:inteiro
   tot:real
inicio
      DataHoje
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==      Receitas atrasadas       == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Pesquisar por banco")
            escreval("[2] - Todas as atrasadas")
            escreval("[0] - Voltar")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>2) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=2) e (escolher>=0)
      se (escolher=0) entao
         limpatela
         MenuBanco
      fimse
            //BANCO A BANCO
      se (escolher=1) entao
      limpatela
         pesq<-escolhebanco(bnk)
         escreval()
         escreval("=======================")
         escreval(bnk)
         escreval("=======================")
         escreval ("cód.parcela":12,"|","cód.cliente":12,"|"," Data venc.":12,"|"," Valor":12)
         escreval ("--------------------------------------------------------------")
         para l<-1 ate 200 faca
              se (datapag[l]="") e (codigop[l]<>"") e (pesq=banco[l]) entao
                 tmp<-copia(dataven[l], 7, 2)
                 tmp<-tmp+(copia(dataven[l], 4, 2))
                 tmp<-tmp+(copia(dataven[l],1,2))
                 se (caracpnum(tmp) < caracpnum(K)) entao
                    escreval ("   ",parcela[l]:12, codigop[l]:12, dataven[l]:12, parvalor[l]:12)
                    tot<-tot+caracpnum(parvalor[l])
                 fimse
              fimse
         fimpara
      fimse
           //TOTAL EM ATRASO
      se (escolher=2) entao
         limpatela
         escreval("=============================")
         escreval("      Hoje é ", datac,"     =")
         escreval("=============================")
         escreval("    Parcelas em atraso:     =")
         escreval("==============================================================")
         escreval ("cód.parcela":12,"|","cód.cliente":12,"|"," Data venc.":12,"|"," Valor":8,"|","  Banco")
         escreval ("-------------------------------------------------------------")
         para l<-1 ate 200 faca
              se (datapag[l]="") e (codigop[l]<>"") entao
                 tmp<-copia(dataven[l], 7, 2)
                 tmp<-tmp+(copia(dataven[l], 4, 2))
                 tmp<-tmp+(copia(dataven[l],1,2))
                 se (caracpnum(tmp) < caracpnum(K)) entao
                    escreval ("   ",parcela[l]:12, codigop[l]:12, dataven[l]:12, parvalor[l]:12, banco[l])
                    tot<-tot+caracpnum(parvalor[l])
                 fimse
              fimse
         fimpara
         escreval("===============================================================")
         escreval()
         escreval("O total de parcelas atrasadas R$ ", tot)
         escreval()
      fimse
fimprocedimento
//=====================================================MENU DE CLIENTES=========
procedimento menucliente
var
   ufcheck, temp, temp2,voltar, aux:caracter
   i, escolher:inteiro
   existe, pagcheck:logico

Inicio
   c:=1
   ufcheck:="12"
   //MENU PRINCIPAL=============================================================
   limpatela
   repita
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== == == ==    O que deseja modificar?    == == == ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("[1] - Incluir um cliente")
      escreval("[2] - Modificar um cliente")
      escreval("[3] - Excluir um cliente")
      escreval("[0] - Voltar para o menu principal")
      escreval("== == == == == == == == == == == == == == == == == ==")
      leia (escolher)
      se escolher > 4 entao
         limpatela
         escreval("")
         escreval("Opção inválida")
         escreval("")
      fimse
      se escolher < 0 entao
         limpatela
         escreval("")
         escreval("Opção inválida")
         escreval("")
      fimse
   ate (escolher < 4) ou (escolher >= 0)

   //INCLUIR CLIENTE============================================================
   se escolher = 1 entao
      limpatela
      repita
            c:=c+1
       ate (nome[c]) = "")
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== Informe os dados do cliente que deseja incluir: ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      se (nome[c]) = "" entao
         escreva("Informe o nome do cliente: ")
         leia (nome[c])
         escreva("Informe o CPF do cliente ")
         leia (cpf[c])
         escreva("Informe o código do cliente de 4 digitos: ")
         repita
               leia(temp)
               existe<-verificacod(temp)
               se (existe=VERDADEIRO) entao
               limpatela
                  escreval ("Código ", temp, " já existe")
                  escreval ("Por favor insira um novo código de cliente")
               fimse
         ate (existe=FALSO)
         codigoC[c]<-temp
         escreva("Informe a cidade do cliente:")
         leia (cidade[c])
         escreva("Informe a unidade federativa do cliente(Ex.: São Paulo = SP)")
         repita
            leia (uf[c])
            se compr(uf[c]) <> compr(ufcheck) entao
               escreval("UF inválido, favor inserir um UF válido.")
            fimse
         ate compr(uf[c]) = compr(ufcheck)
         limpatela
         escreval("==========================================")
         escreval("cliente criado com sucesso")
         escreval()
         escreval("=============================================")
         escreval("Para voltar ao Menu CLIENTES pressione 'ENTER'")
         leia(voltar)
         menucliente
      fimse
   fimse
   //MODIFICAR CLIENTE=======================================================
   se escolher = 2 entao
      limpatela
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("==  Informe o CODIGO do cliente que deseja alterar:   ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      leia (aux)
      i:=1
      enquanto aux <> codigoc[i] faca
         i:=i+1
         se i>200 entao
            i:=1
            escreva("Cliente inválido, favor inserir um código válido:")
            leia (aux)
         fimse
      fimenquanto
      limpatela
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== == ==    Informe o que deseja alterar:   == ==  ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("[1] - Nome ")
      escreval("[2] - Cidade")
      escreval("[3] - UF")
      escreval("[4] - CPF")
      escreval("[0] - Voltar")
      leia (escolher)
      repita
         se escolher < 0 entao
            escreva("Opção inválida, favor inserir uma opção válida:")
            leia (escolher)
         fimse
         se escolher > 4 entao
            escreva("Opção inválida, favor inserir uma opção válida:")
            leia (escolher)
         fimse
      ate (escolher >= 0) ou (escolher <= 4)
      se escolher =1 entao
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("O NOME ATUAL É:", nome[i])
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreva("INFORME O NOVO NOME:")
         aux := nome[i]
         leia (nome[i])
         repita
            se aux = nome[i] entao
               escreval("Favor inserir um nome diferente do anterior")
               leia (nome[i])
            fimse
         ate aux <> nome[i]
         se aux <> nome[i] entao
            limpatela
            escreval("Nome atualizado com sucesso.")
            menucliente
         fimse
      fimse
      se escolher =2 entao
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("A CIDADE ATUAL É:", cidade[i])
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreva("INFORME A NOVA CIDADE:")
         aux := cidade[i]
         leia (cidade[i])
         repita
            se aux = cidade[i] entao
               escreval("Favor inserir uma cidade diferente da anterior")
               leia (cidade[i])
            fimse
         ate aux <> cidade[i]
         se aux <> cidade[i] entao
            limpatela
            escreval("Cidade atualizada com sucesso.")
            menucliente
         fimse
      fimse
      se escolher =3 entao
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("O ESTADO ATUAL É:", uf[i])
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreva("INFORME O NOVO ESTADO:")
         aux := uf[i]
         leia (uf[i])
         repita
            se aux = uf[i] entao
               escreval("Favor inserir um Estado diferente do anterior")
               leia (uf[i])
            fimse
         ate (aux <> uf[i])
         se aux <> uf[i] entao
            limpatela
            escreval("UF atualizado com sucesso.")
            menucliente
         fimse
      fimse
      se escolher=4 entao
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreval("O CPF ATUAL É:", cpf[i])
         escreval("== == == == == == == == == == == == == == == == == ==")
         escreva("INFORME O NOVO CPF:")
         aux := cpf[i]
         leia (cpf[i])
         repita
            se aux = cpf[i] entao
               escreval("Favor inserir um CPF diferente do anterior")
               leia (cpf[i])
            fimse
         ate aux <> cpf[i]
         se aux <> cpf[i] entao
            limpatela
            escreval("CPF atualizado com sucesso.")
            menucliente
         fimse
      fimse
      se escolher = 0 entao
         limpatela
         menucliente
      fimse
   fimse
   //EXCLUSÃO DE CLIENTES
   limpatela
   se escolher =3 entao
      escreval("== == == == == == == == == == == == == == == == == ==")
      escreval("== Informe o Codigo do cliente que deseja excluir: ==")
      escreval("== == == == == == == == == == == == == == == == == ==")
      leia (aux)
      repita
         i:=i+1
         se i=201 entao
            escreva("Cliente não cadastrado, favor inserir um codigo válido: ")
            leia (aux)
            i:=1
         fimse
      ate (aux = codigoc[i]) e  (aux <> "")
      j:=0
      repita
         j:=j+1
      ate (codigoC[i] = codigoP[j]) ou (j=200)
      se (datapag[j] <> ("")) ou (codigop[j] = ("")) entao
         pagcheck:= VERDADEIRO
      senao
         pagcheck:= FALSO
      fimse
      se pagcheck= VERDADEIRO entao
         escreval("ESSA AÇÃO NÃO PODERÁ SER REVERTIDA!")
         escreval("CASO DESEJE EXCLUIR O CLIENTE APERTE ENTER")
         escreval("CASO DESEJE VOLTAR DIGITE: 9")
         leia (aux)
         se aux = "9" entao
            menucliente
         senao
            codigoP[j]:= ("")
            codigoC[i]:= ("")
            parcela[j]:= ("")
            dataven[j]:= ("")
            datapag[j]:= ("")
            parvalor[j]:= ("")
            banco[i]:= ("")
            nome[i]:= ("")
            cidade[i]:= ("")
            uf[i]:= ("")
            cpf[i]:= ("")
         fimse
      senao
         escreval("O CLIENTE NÃO PODE SER EXCLUIDO.")
         escreval("EXISTE UMA PARCELA EM ABERTO.")
         escreval("Pressione ENTER para continuar.")
         leia (aux)
         limpatela
         menucliente
      fimse
   fimse
fimprocedimento
//==============================================================================
procedimento pesquisa_cliente_codigo (var l:inteiro)
inicio
limpatela
l <- 1
escreval("Pesquise por codigo: ")
leia (pesq)
      repita
            l <- l + 1
            se (l > 200) entao
               escreval("Informação invalida")
               escreval("Por favor tente novamente")
            fimse
      ate (pesq = codigoC[l]) ou (l > 200)
      escreval ("  cód.cli. |         nome        |          cidade         | UF |      CPF/CNPJ")
      escreval ("--------------------------------------------------------------------------------")
      escreval("   ",codigoC[l]:10, nome[l]:22,  cidade[l]:26,  uf[l]:4,  cpf[l])
      escreval("================================")
fimprocedimento
//==============================================================================
procedimento Receitacli
inicio
      escreval ("cód.parcela":12,"|"," Data venc.":12,"|","Data Pag. ":12,"|"," Valor":8,"|","   banco")
      escreval ("-------------------------------------------------------------")
      para j de 1 ate 200 faca
           se (codigoC[c] = codigoP[j]) e (dataPag[j] <> "") entao
              escreval("   ",parcela[j]:12, dataVen[j]:12, dataPag[j]:12, parValor[j]:12, banco[j])
           fimse
      fimpara
fimprocedimento
//==============================================================================
procedimento ReceitasGCliente
inicio
      escreval ("cód.parcela":12,"|"," Data venc.":12,"|","Data Pag. ":12,"|"," Valor":8)
      escreval ("-------------------------------------------------------------")
      Para j de 1 ate 200 faca
           Se (CodigoC[c] = CodigoP[j]) entao
              Escreval ("   ", parcela[j]:12,dataven[j]:12,datapag[j]:12,parvalor[j])
           fimse
      fimpara
fimprocedimento
//==============================================================================
procedimento pesquisa_cliente_uf
var
   l: inteiro
inicio
limpatela
l <- 1
escreval("Pesquise por estado ou cidade: ")
leia (pesq)
escreval()
pesq <- maiusc(pesq)
escreval ("  cód.cli. |         nome        |          cidade         | UF |      CPF/CNPJ")
escreval ("------------------------------------------------------------------------------------")
      para l de 1 ate 200 faca
           se (pesq = cidade[l]) ou (pesq = uf[l]) entao
              escreval("   ",codigoC[l]:10, nome[l]:22, cidade[l]:26, uf[l]:4, cpf[l])
           fimse
      fimpara
fimprocedimento
//==============================================================================
procedimento MenuPesq
var
   escolher:inteiro
   voltar: caractere
inicio
      limpatela
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==      Pesquisa de clientes     == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Pesquisar cliente expecifico (por cód.)")
            escreval("[2] - Pesquisar por cidade ou estado")
            escreval("[0] - Voltar para o menu principal")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>2) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=2) e (escolher>=0)
      se (escolher=0) entao
         MenuPrincipal
      fimse
//==============================================================================
      limpatela
      se (escolher=1) entao
         pesquisa_cliente_codigo(C)
         repita
               escreval("[1] - Receitas gerais do cliente")
               escreval("[2] - Receitas recebidas do cliente")
               escreval("[0] - Voltar ao menu de pesquisa")
               escreval("======================================")
               leia(escolher)
               se (escolher>2) ou (escolher<0) entao
                  limpatela
                  escreval ("Opção inválida")
                  escreval ()
               fimse
         ate (escolher<=2) e (escolher>=0)
         se (escolher=0) entao
            MenuPesq
         fimse
         se (escolher=1) entao
            ReceitasGCliente
            escreval("=============================================")
            escreval("Para voltar ao Menu PESQUISA pressione 'ENTER'")
            leia(voltar)
            MenuPesq
         fimse
         se (escolher=2) entao
            Receitacli
            escreval("=============================================")
            escreval("Para voltar ao Menu PESQUISA pressione 'ENTER'")
            leia(voltar)
            MenuPesq
         fimse
      fimse
      se (escolher=2) entao
         limpatela
         pesquisa_cliente_uf
         escreval("=============================================")
         escreval("Para voltar ao Menu PESQUISA pressione 'ENTER'")
         leia(voltar)
         MenuPesq
      fimse
fimprocedimento
//==============================================================================
procedimento ordemalfabetica
var
   aux:caractere
   troca:logico
inicio

   Para i de 1 ate 150 faca
      para j de i+1 ate 151 faca
         Se maiusc(nome[i]) > maiusc(nome[j]) entao
            aux := nome[j]
            nome[j] := nome[i]
            nome[i] := aux
            troca<- verdadeiro
            se troca=verdadeiro entao
               aux := CodigoC[j]
               codigoC[j] := codigoC[i]
               codigoC[i] := aux
               aux := cidade[j]
               cidade[j] := cidade[i]
               cidade[i] := aux
               aux := uf[j]
               uf[j] := uf[i]
               uf[i] := aux
               aux := cpf[j]
               cpf[j] := cpf[i]
               cpf[i] := aux
            fimse
         fimse
      fimpara
   fimpara
   escreval ("  cód.cli. |         nome        |          cidade         | UF |      CPF/CNPJ")
   escreval ("------------------------------------------------------------------------------------")
   para i de 1 ate 150 faca
        se (codigoC[i]<>"") entao
          escreval("   ",codigoC[i]:10, nome[i]:22, cidade[i]:26, uf[i]:4, cpf[i])
        fimse
   fimpara
fimprocedimento
//==============================================================================
Procedimento OrdemDataVen
var
   aux, tmp, dat:caractere
   troca:logico
inicio
   Para i de 1 ate 100 faca
      para j de i+1 ate 101 faca
         dat <- copia(dataven[i], 7, 2)
         dat <- dat + (copia(dataven[i], 4, 2))
         dat <- dat + (copia(dataven[i],1,2))
         aux <- copia(dataven[j], 7, 2)
         aux <- aux +(copia(dataven[j], 4, 2))
         aux <- aux +(copia(dataven[j],1,2))
         Se aux < dat entao
            tmp := dataven[j]
            dataven[j] := dataven[i]
            dataven[i] := tmp
            troca<-verdadeiro
            se troca=verdadeiro entao
               aux := CodigoP[j]
               codigoP[j] := codigoP[i]
               codigoP[i] := aux
               aux := parcela[j]
               parcela[j] := parcela[i]
               parcela[i] := aux
               aux := datapag[j]
               datapag[j] := datapag[i]
               datapag[i] := aux
               aux := parvalor[j]
               parvalor[j] := parvalor[i]
               parvalor[i] := aux
               aux := banco[j]
               banco[j] := banco[i]
               banco[i] := aux
            fimse
         fimse
      fimpara
   fimpara
   escreval ("   parcela  |  cód.cli |  Data ven  |  Data Pag  | Valor    | banco")
   escreval ("--------------------------------------------------------------------")
   Para i de 1 ate 100 faca
        se (codigop[i]<>"") entao
           escreval("   ",parcela[i]:12, codigoP[i]:12, dataven[i]:12, datapag[i]:12, parvalor[i]:12, banco[i])
        fimse
   fimpara
Fimprocedimento
//==============================================================================
procedimento MenuOrdena
var
   escolher:inteiro
   voltar: caractere
inicio
      limpatela
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==        Menu de Ordenação      == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - Ordena clientes por ordem alfabetica")
            escreval("[2] - Ordena parcelas por data de vencimento")
            escreval("[0] - Voltar para o menu principal")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>2) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=2) e (escolher>=0)
      se (escolher=0) entao
         MenuPrincipal
      fimse
//==============================================================================
      limpatela
      se (escolher=1) entao
         limpatela
         ordemalfabetica
         escreval()
         escreval("=============================================")
         escreval("Para voltar ao Menu ORDENAÇAO pressione 'ENTER'")
         leia(voltar)
         MenuOrdena
      fimse
      se (escolher=2) entao
         limpatela
         OrdemDataVen
         escreval()
         escreval("=============================================")
         escreval("Para voltar ao Menu ORDENAÇAO pressione 'ENTER'")
         leia(voltar)
         MenuOrdena
      fimse
fimprocedimento
//==============================================================================
procedimento creditos
var
   leitura:caracter
inicio
   limpatela
   escreval("== == == == == == == == == == == == == == == == == ==")
   escreval("== ==   Software produzido por: Emergency Food  == ==")
   escreval("== == == == == == == == == == == == == == == == == ==")
   escreval("== == == == == == == == == == == == == == == == == ==")
   escreval("== == P.O.: Beatriz Domingues Vespa|''Aib''  == == ==")
   escreval("== == S.M.: Leonardo Losso Szychta|''Psychogumelo''==")
   escreval("== == Dev.: Luana Beatriz Alvares|''Kalimbor''  == ==")
   escreval("== == Dev.: Thiago Luiz Soares Arcoverde|''airn''  ==")
   escreval("== == Dev.: Vinícius Bortoleti|''MysterySkulls987''==")
   escreval("== == == == == == == == == == == == == == == == == ==")
   leia(aux)
   leitura:=("")
   limpatela
   menuprincipal
fimprocedimento
//==============================================================================
procedimento MenuPrincipal
var
   sair, escolher:inteiro
inicio
      limpatela
      repita
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("== == == ==         MENU PRINCIPAL        == == == ==")
            escreval("== == == == == == == == == == == == == == == == == ==")
            escreval("[1] - ORDENAÇÃO")
            escreval("[2] - PESQUISA")
            escreval("[3] - BANCO")
            escreval("[4] - CLIENTES")
            escreval("[5] - PARCELAS")
            escreval("[6] - CREDITOS")
            escreval("[0] - SAIR")
            escreval("== == == == == == == == == == == == == == == == == ==")
            leia (escolher)
            se (escolher>6) ou (escolher<0) entao
               limpatela
               escreval ("Opção inválida")
               escreval ()
            fimse
      ate (escolher<=6) e (escolher>=0)
      se (escolher=0) entao
      fimse
      se (escolher=1) entao
         MenuOrdena()
      fimse
      se (escolher=2) entao
         MenuPesq()
      fimse
      se (escolher=3) entao
         MenuBanco()
      fimse
      se (escolher=4) entao
         MenuCliente()
      fimse
      se (escolher=5) entao
         MenuParcela()
      fimse
      se (escolher=6) entao
         Creditos()
      fimse
fimprocedimento
//==============================================================================
inicio
      Lecliente
      LeParcela
      limpatela
      menuprincipal
      limpatela
      Escreval("S  A  I  N  D  O  .  .  .")
       para c de 1 ate 150 faca
           escreval (cidade[c])
      fimpara

fimalgoritmo




