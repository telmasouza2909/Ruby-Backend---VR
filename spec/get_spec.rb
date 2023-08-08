describe 'Dado que acesso o endpoint da consulta exposto no nosso portal' do
    it 'get - retona a chave do tipo typeOfEstablishment' do
         #Validar o acesso a URL da API WEB
        @primeiro_teste = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')
        puts @primeiro_teste
    end
end 


