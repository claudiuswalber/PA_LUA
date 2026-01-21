-- FORMULA DA PROGRESSÃO ARITMÉTICA (PA) => an = a1 + (n-1) * r
-- razão (r)
-- termoProcurado => an
-- termoConhecido => a1 ou outro qualquer todavia o 1 deve ser
-- 	substituido pelo índice do termo conhecido ex: se a2 é o
--  termo conhecido, então será n - 2

--- CÁLCULO DA RAZAO DA PA
local function calculoRazao(termo1,termo2, posicao1, posicao2)
		local razao = (termo2 - termo1) / (posicao2-posicao1)
	return razao
end

--- CÁLCULO DE UM TERMO QUALQUER DE UMA PA
local function PA(posicaoConhecida, posicaoProcurada, termoConhecido, razao)
		-- PA => an = a1 + (n-1) * r
		local an = termoConhecido + (posicaoProcurada-posicaoConhecida) * razao
	return an
end

-- SOMA DOS TERMOS DA PA ATÉ UMA POSIÇÃO QUALQUER
local function somaTermos(termoInicial, termoProcurado, posicaoProcurada)
	local sn
		-- sn = ((a1 + an) * n )/2
		sn = ((termoInicial + termoProcurado) * posicaoProcurada)/2
	return sn
end

-- EXEMPLO PA PARA DESCOBRIR A RAZÃO
local posicaoTermo1 = 2
local posicaoTermo2 = 6
local termo1 = 4
local termo2 = 16

-- Descobrindo a razão da PA
local razao = calculoRazao(termo1, termo2, posicaoTermo1, posicaoTermo2)
print("A razao da PA eh: "..razao)
--RESULTADO: A razao da PA eh: 3

-- Dados para procurar um termo qualquer da PA
local posicaoConhecida = posicaoTermo1
local termoConhecido = termo1
local posicaoProcurada = 7
-- Calculando o 1o termo da PA para usar na Soma dos Termos
local posicaoInicial = PA(posicaoConhecida,1,termoConhecido,razao)

-- Calculando um termo qualquer da PA
local termoProcurado = PA(posicaoConhecida,posicaoProcurada,termoConhecido,razao)
-- Exibindo o termoProcurado
print("O valor procurado para a posicao a"..posicaoProcurada.." = ".. termoProcurado)
--RESULTADO: O valor procurado para a posicao a7 = 19

-- Criando uma tabela pois em LUA não exitem arrays nativos, para receber a sequência da PA
local seq = {}

-- Insere os valores na tabela
for i=1,posicaoProcurada do
	table.insert(seq,PA(posicaoConhecida,i,termoConhecido,razao))
end

-- Exibindo a sequência da PA
print("PA = {"..table.concat(seq, ", ").."}")
--RESULTADO: PA = {1, 4, 7, 10, 13, 16, 19}

-- Exibindo a Soma dos Termos da PA
print("Soma dos Termos = " .. somaTermos(posicaoInicial, termoProcurado, posicaoProcurada))
--RESULTADO: Soma dos Termos = 70
