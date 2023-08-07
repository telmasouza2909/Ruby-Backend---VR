describe 'servico do tipo typeOfEstablishment - metodos de verbo GET' do
 
    it 'meu primeiro teste - servico do tipo typeOfEstablishment' do
        @Servicos = Servicos.get('/api-web/comum/enumerations/VRPAT')
        gets @Servicos
    end
  end