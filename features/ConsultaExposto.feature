#language: pt

Funcionalidade: Estabelecimento do tipo typeOfEstablishment
    que acesso o endpoint de consulta exposto no nosso portal
    
@get_tipo_typeOfEstablishment
Cenário: Validar a chave do serviço
    Dado o serviço retorna uma série de informações sobre nossos produtos
    And estabelecimentos
    Então o serviço retona a chave do tipo typeOfEstablishment