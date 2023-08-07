#language: pt

@primeiro
Funcionalidade: Estabelecimento do tipo typeOfEstablishment
    Given que acesso o endpoint de consulta exposto no nosso portal
    validar o serviço que possui a chave typeOfEstablishment

@primeiro
Cenário: Validar a chave do serviço
    Quando o serviço retorna uma série de informações sobre nossos produtos
    And estabelecimentos
    Então o serviço retona a chave do tipo typeOfEstablishment