import matplotlib.pyplot as plt

def ler_dados_csv(nome_arquivo='Anexo_Arquivo_Dados_Projeto_Logica_e_programacao_de_computadores.csv'):
    dados = []
    with open(nome_arquivo, 'r') as arquivo:
        for linha in arquivo:
            valores = linha.strip().split(',')
            dados.append(valores)
    return dados

def validar_ano(mensagem):
    while True:
        try:
            ano = int(input(mensagem))
            if 1961 <= ano <= 2016:
                return ano
            else:
                print("ANO INVÁLIDO :(")
        except ValueError:
            print("POR FAVOR, INSIRA UM VALOR NUMÉRICO VÁLIDO.")

def validar_mes():
    while True:
        try:
            mes = int(input("INFORME O MÊS PARA VERIFICAÇÃO DOS DADOS (1 A 12): "))
            if 1 <= mes <= 12:
                return mes
            else:
                print("MÊS INVÁLIDO :(")
        except ValueError:
            print("POR FAVOR, INSIRA UM VALOR NUMÉRICO VÁLIDO.")

def validar_periodo():
    while True:
        try:
            print("--------------------------------------------------------------------------------")
            ano_inicial = validar_ano("INFORME O ANO INICIAL DO PERÍODO (1961 A 2016): ")
            mes_inicial = validar_mes()
            ano_final = validar_ano("INFORME O ANO FINAL DO PERÍODO (1961 A 2016): ")
            mes_final = validar_mes()

            if ano_final < ano_inicial or (ano_final == ano_inicial and mes_final < mes_inicial):
                print("O ANO E MÊS FINAL DEVEM SER POSTERIORES AO ANO E MÊS INICIAL.")
            else:
                return (ano_inicial, mes_inicial), (ano_final, mes_final)
        except ValueError:
            print("Por favor, insira valores numéricos válidos.")

def validar_opcao():
    while True:
        try:
            optativa = int(input("INFORME: \n 1 - PARA VERIFICAR TODOS OS DADOS DO PERÍODO.\n 2 - PARA VERIFICAR A PRECIPITAÇÃO. \n 3 - PARA VERIFICAR AS TEMPERATURAS. \n 4 - PARA VERIFICAR A UMIDADE E VENTO. "))
            if 1 <= optativa <= 4:
                return optativa
            else:
                print("OPÇÃO INVÁLIDA :(")
        except ValueError:
            print("Por favor, insira um valor numérico válido.")

def mostrar_dados_por_periodo(dados, periodo, optativa):
    periodo_inicial, periodo_final = periodo
    for dado in dados:
        if len(dado) >= 8 and len(dado[0].split('/')) >= 3:
            data_dado = dado[0].split('/')
            ano_dado, mes_dado = int(data_dado[2]), int(data_dado[1])
            if periodo_inicial <= (ano_dado, mes_dado) <= periodo_final:
                if optativa == 1:
                    print(f"Data: {dado[0]}, Precipitação: {dado[1]}, Temp Máxima: {dado[2]}, Temp Mínima: {dado[3]}, Temp Média: {dado[5]}, Umidade: {dado[6]}, Velocidade do Vento: {dado[7]}")
                    print("--------------------------------------------------------------------------------")
                elif optativa == 2:
                    print(f"Data: {dado[0]}, Precipitação: {dado[1]}")
                    print("--------------------------------------------------------------------------------")
                elif optativa == 3:
                    print(f"Data: {dado[0]}, Temp Máxima: {dado[2]}, Temp Mínima: {dado[3]}, Temp Média: {dado[5]}")
                    print("--------------------------------------------------------------------------------")
                elif optativa == 4:
                    print(f"Data: {dado[0]}, Umidade: {dado[6]}, Velocidade do Vento: {dado[7]}")
                    print("--------------------------------------------------------------------------------")

def mes_mais_chuvoso(dados, periodo):
    precipitacao_maxima = 0
    mes_ano_maximo = ''
    periodo_inicial, periodo_final = periodo

    for dado in dados[1:]:
        data_dado = dado[0].split('/')
        ano_dado, mes_dado = int(data_dado[2]), int(data_dado[1])
        precipitacao = float(dado[1])

        if periodo_inicial <= (ano_dado, mes_dado) <= periodo_final:
            if precipitacao > precipitacao_maxima:
                precipitacao_maxima = precipitacao
                mes_ano_maximo = f"{mes_dado}/{ano_dado}"

    return mes_ano_maximo, precipitacao_maxima

def calcular_media_temp_minima_por_mes(dados, mes, ano_inicial):
    medias_por_mes = {}
    for dado in dados[1:]:
        data_dado = dado[0].split('/')
        ano_dado, mes_dado = int(data_dado[2]), int(data_dado[1])
        temp_minima = float(dado[3])
        chave = f"{mes_dado}/{ano_dado}"
        if chave not in medias_por_mes and ano_inicial <= ano_dado <= ano_inicial + 11 and mes_dado == mes:
            medias_por_mes[chave] = [temp_minima]
        elif chave in medias_por_mes and ano_inicial <= ano_dado <= ano_inicial + 11 and mes_dado == mes:
            medias_por_mes[chave].append(temp_minima)
    for chave, valores in medias_por_mes.items():
        medias_por_mes[chave] = sum(valores) / len(valores)
    return medias_por_mes

def gerar_grafico_barras_medias_temp_minima(medias_por_mes):
    meses_anos = list(medias_por_mes.keys())
    medias = list(medias_por_mes.values())

    plt.bar(meses_anos, medias, color='skyblue')
    plt.xlabel('Mês/Ano')
    plt.ylabel('Média de Temperatura Mínima (°C)')
    plt.title('Médias de Temperatura Mínima por Mês/Ano')
    plt.xticks(rotation=45, ha='right')
    plt.tight_layout()
    plt.show()

def calcular_media_geral_temp_minima(medias_por_mes):
    valores_medias = list(medias_por_mes.values())
    media_geral = sum(valores_medias) / len(valores_medias)
    return media_geral

# Main code
print("BEM-VINDO AO SISTEMA DE ANÁLISE CLIMÁTICA!")
print("ESTE PROGRAMA PERMITE ANALISAR DADOS METEOROLÓGICOS, INCLUINDO PRECIPITAÇÃO, TEMPERATURA, UMIDADE E VELOCIDADE DO VENTO.")
print("POR FAVOR, SIGA AS INSTRUÇÕES PARA REALIZAR A ANÁLISE DESEJADA.")
nome_arquivo = 'Anexo_Arquivo_Dados_Projeto_Logica_e_programacao_de_computadores.csv'
dados = ler_dados_csv(nome_arquivo)

periodo = validar_periodo()
optativa = validar_opcao()

mostrar_dados_por_periodo(dados, periodo, optativa)

if optativa == 2:
    mes_chuvoso, precipitacao_maxima = mes_mais_chuvoso(dados, periodo)
    ano_inicial, mes_inicial = periodo[0]
    ano_final, mes_final = periodo[1]
    print(f"O MÊS MAIS CHUVOSO NO PERÍODO DE {mes_inicial}/{ano_inicial} A {mes_final}/{ano_final} FOI {mes_chuvoso} COM UMA PRECIPITAÇÃO DE {precipitacao_maxima}mm.")
elif optativa == 3:
    mes = validar_mes()
    medias_temp_minima_por_mes = calcular_media_temp_minima_por_mes(dados, mes, periodo[0][0])
    ano_inicial, ano_final = periodo[0][0], periodo[1][0]
    print(f"A MÉDIA DA TEMPERATURA MÍNIMA PARA O MÊS {mes} NOS 11 ANOS A PARTIR DE {ano_inicial} FOI DE:")
    for chave, valor in medias_temp_minima_por_mes.items():
        print(f"{chave}: {valor}°C")
    media_geral = calcular_media_geral_temp_minima(medias_temp_minima_por_mes)
    print(f"A MÉDIA GERAL DA TEMPERATURA MÍNIMA PARA O MÊS {mes} NOS ÚLTIMOS 11 ANOS FOI DE {media_geral}°C.")

if optativa in (1, 2, 3, 4):
    while True:
        try:
            optativa_2 = int(input("DESEJA REALIZAR OUTRAS OPERAÇÕES? (COM BASE NOS ANOS JÁ INFORMADOS) \n \n 5 - PARA CALCULAR A MÉDIA DA TEMPERATURA MÍNIMA DE UM DETERMINADO MÊS. \n 6 - PARA GERAR UM GRÁFICO DE BARRAS COM AS MÉDIAS DE TEMPERATURA MÍNIMA DE UM DETERMINADO MÊS. \n 7 - PARA CALCULAR A MÉDIA GERAL DA TEMPERATURA MÍNIMA DE UM DETERMINADO MÊS. \n 0 - SAIR. "))
            if optativa_2 == 0:
                print("FIM DO PROGRAMA :)")
                print("--------------------------------------------------------------------------------")
                break
            elif optativa_2 == 5:
                mes = validar_mes()
                medias_temp_minima_por_mes = calcular_media_temp_minima_por_mes(dados, mes, periodo[0][0])
                ano_inicial, ano_final = periodo[0][0], periodo[1][0]
                print(f"A MÉDIA DA TEMPERATURA MÍNIMA PARA O MÊS {mes} NOS 11 ANOS A PARTIR DE {ano_inicial} FOI DE:")
                for chave, valor in medias_temp_minima_por_mes.items():
                    print(f"{chave}: {valor}°C")
            elif optativa_2 == 6:
                mes = validar_mes()
                medias_temp_minima_por_mes = calcular_media_temp_minima_por_mes(dados, mes, periodo[0][0])
                gerar_grafico_barras_medias_temp_minima(medias_temp_minima_por_mes)
            elif optativa_2 == 7:
                mes = validar_mes()
                medias_temp_minima_por_mes = calcular_media_temp_minima_por_mes(dados, mes, periodo[0][0])
                media_geral = calcular_media_geral_temp_minima(medias_temp_minima_por_mes)
                print("--------------------------------------------------------------------------------")
                print(f"A MÉDIA GERAL DA TEMPERATURA MÍNIMA PARA O MÊS {mes} NOS ÚLTIMOS 11 ANOS FOI DE {media_geral}°C.")
                print("--------------------------------------------------------------------------------")
            else:
                print("OPÇÃO INVÁLIDA :(")
        except ValueError:
            print("POR FAVOR, INSIRA UM VALOR NUMÉRICO VÁLIDO.")