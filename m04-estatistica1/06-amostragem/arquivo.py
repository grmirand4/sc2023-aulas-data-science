import csv
import random

# Definindo os cabeçalhos do arquivo CSV
headers = ["ID", "Nome", "Cargo", "Salario"]

# Lista de nomes fictícios
nomes = ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Hannah", "Ivan", "Jasmine"]

# Lista de cargos fictícios
cargos = ["Engenheiro", "Analista", "Gerente", "Desenvolvedor", "Designer", "Vendedor", "Consultor", "Diretor", "Estagiário", "Técnico"]

# Criando o arquivo CSV
with open('salarios.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(headers)  # Escrevendo os cabeçalhos
    
    # Gerando 1000 registros aleatórios
    for i in range(1000):
        id = i + 1
        nome = random.choice(nomes)
        cargo = random.choice(cargos)
        salario = round(random.uniform(2000, 10000), 2)  # Salários aleatórios entre 2000 e 10000
        writer.writerow([id, nome, cargo, salario])

print("Arquivo 'salarios.csv' criado com sucesso!")