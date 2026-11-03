
import sys

print("Python funcionando!")
print("Versão:", sys.version.split()[0])
print("Executável:", sys.executable)

vendas = [150, 200, 350, 100]
media = sum(vendas) / len(vendas)

print(f"Total de vendas: R$ {sum(vendas):.2f}")
print(f"Média de vendas: R$ {media:.2f}")
