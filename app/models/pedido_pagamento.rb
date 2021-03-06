class PedidoPagamento < ActiveRecord::Base
  
  belongs_to :pedido

  attr_reader :tipo_pagamento
    
  def descricao
    raise "Abstract method!"
  end

  def initialize(valor_inicial)
    super()
    validar_valor(valor_inicial)
    write_attribute(:valor, valor_inicial)
  end
  
protected

  def validar_valor (valor)
    if !valor || valor.nil?
      raise "Pagamento deve ter um valor informado!"
    elsif ( valor < 0.01 )
      raise "Valor do pagamento deve ser um número positivo!"
    end
  end  

end
