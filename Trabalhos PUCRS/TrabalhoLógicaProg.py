#Variáveis e import's
import random
import calendar
somaTemp = 0
tempMaisQuente = -60
tempMaisFrio = 50
escaldante = 0
mesQuente = ""
mesFrio = ""

#Loop + Inputs
for cont in range (1,13):
    mes=int(input('digite o mes (1 a 12): '))
    nomeMes = calendar.month_name[mes]
    temperatura=float(input("digite a temperatura deste mes: "))

    #Soma de temperaturas
    somaTemp = somaTemp + temperatura

    #Media temperaturas
    temperaturaMedia = somaTemp/12

    #Mensagem de erro!
    if mes<1 or mes>12 or temperatura<-60 or temperatura>50 :
        print("Este valor não é válido!")
        break
    
    #Calculo meses escaldantes
    if temperatura > 33:
        escaldante += 1

    #Calculo mes mais quente    
    if temperatura > tempMaisQuente:
        tempMaisQuente = temperatura
        mesQuente = nomeMes


    #Calculo mes mais frio    
    if temperatura < tempMaisFrio:
        tempMaisFrio = temperatura
        mesFrio = nomeMes


#Resultados
print("Temperatura média dos meses digitados: ", temperaturaMedia)
print("Quantidade de meses quentes:", escaldante)
print("Mes mais quente dos meses digitados:", mesQuente)
print("Mes mais frio:", mesFrio)



        