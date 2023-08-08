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
