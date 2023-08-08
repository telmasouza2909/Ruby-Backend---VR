## Ruby_HttParty_Rspec_Cucumber

# Ruby
1 - Baixar o framework "Ruby" no site 'https://www.ruby-lang.org/pt/downloads/'

# CMDER
2 - Baixe o cmder no site 'https://cmder.net/'

3 - Cria uma pasta no disco "C", com a nomeclatura <nomeclatura>, dentro dela deixar o cmder.

4 - Abre a IDE e selecionar o projeto, na pasta criada no passo anterior.
OBS: Neste projeto utilizei a IDE, baixada no site 'https://code.visualstudio.com/'

5 - Abre o cmder, acessar a pasta do projeto com o comando, por exemplo 'cd C:\ruby\Projetos\Modelo'

6 - Baixe os plugin's do VSCODE, na parte 'extension':
    Ruby
    Cucumber
    VSCode Icons


# GEM

7 - Instalar o bundler com o comando 'gem install bundler' no cmder

8 - Crie um arquivo dentro do projeto raiz, com a nomeclatura "GemFile", sem extensão. Dentro informar as gems:

    source 'https://rubygems.org'

    gem 'cucumber'
    gem 'factory_bot'
    gem 'faker'
    gem 'httparty'
    gem 'rspec'

9 -  No Cmder, acessar a pasta do projeto e depois executar o comando 'bundler install', para instalar todas as gems informadas.

# Configurando o HttParty

10 - Executar o comando 'rspec --init', será criados os arquivos '.rspec' e o 'spec/spec_helper.rb'.


# Estrutura do projeto

11 - Dentro da pasta "support > env.rb", iremos importar as gems instalar para o projeto:
  
    require 'factory_bot'
    require 'fake'
    require 'httparty'
    require 'rspec'

# Configuração dos ambientes

11 - Dentro do arquivo 'spec/spec_helper.rb', iremos informar as require's:
  
    require 'httparty'
    require 'httparty/request'
    require 'httparty/response/headers'


12 - Iremos configurar o nosso projeto, para rodar no ambiente API_WEB. Iremos criar uma pasta dentro 'services' e depois o arquivo "get_services_chave.rb". Iremos inserir os dados, aonde seria a url da API:
  
    module Servico
    include HTTParty
    #URL Base da API WEB
    base_uri 'https://portal.vr.com.br'
    end

13 - Agora iremos criar um arquivo na pasta 'spec/get_spec' com o nome "get_spec", aonde iremos informar o default dos parametros que ele ira usar para testar e rodar os testes, aonde iremos informar os ambientes e o reports, que seria o relatorios dos testes.

    describe 'Dado que acesso o endpoint da consulta exposto no nosso portal' do
    it 'get - retona a chave do tipo typeOfEstablishment' do
         #Validar o acesso a URL da API WEB
        @primeiro_teste = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')
        puts @primeiro_teste
    end
 end


# Validando a requisição e os dados

14 - Iremos criar um arquivo na pasta 'spec/validando_resposta_spec' com o nome "validando_resposta_spec", aonde iremos validar as respostas e os dados


describe 'Dado que acesso o endpoint da consulta exposto no nosso portal' do
    it 'Então o JSON retorna uma série de informações sobre nossos produtos com a chave do tipo typeOfEstablishment' do
        
        #Validar o acesso a URL da API WEB
        @chave_typeOfEstablishment = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')
        puts @chave_typeOfEstablishment
        
        #Validar a resposta code 200, da requisição GET
        puts @chave_typeOfEstablishment.code()
        expect(@chave_typeOfEstablishment.code).to eq 200

        #Validar o body da requisição GET           
        puts @chave_typeOfEstablishment.body
        expect@chave_typeOfEstablishment.body

        #Validar no JSON a chave “typeOfEstablishment”, retornada pelo serviço
        puts @chave_typeOfEstablishment.parsed_response['typeOfEstablishment']
        expect(@chave_typeOfEstablishment.parsed_response['typeOfEstablishment'])

    end
end

15 - No terminal, executar o comando 'rspec spec/validando_resposta_spec.rb'

# Relatórios de testes

14 - No arquivo 'spec/spec_helper.rb', informar as seguintes configurações:

  config.color = true
  config.formatter = :documentation

16 - No arquivo '.rspec', informar os seguintes comandos:

 --format html --out results/rspec_results.html
 --format json --out results/rspec_results.json
 
17 - Executar o seguinte comando 'rspec spec/validando_resposta_spec.rb' novamente no terminal. O ruby irá criar uma pasta com a nomeclatura 'results', com os relatórios em formato 'JSON' e 'HTML'.