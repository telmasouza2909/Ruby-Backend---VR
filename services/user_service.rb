module Servicos
    include HTTParty
    base_url 'https://portal.vr.com.br'
    format :json
 end