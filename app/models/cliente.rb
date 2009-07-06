class Cliente < ActiveRecord::Base  
    cattr_reader :per_page
    @@per_page = 8 
    usar_como_cpf :cpf
      
    belongs_to :responsavel, :class_name => "Cliente", :foreign_key => :id_responsavel
    has_many :dependentes, :class_name => "Cliente", :foreign_key => :id_responsavel

    validates_presence_of :nome, :message => "deve ser preenchido"
    validates_length_of :nome, :maximum => 50, :message => "pode ter no máximo 50 caracteres"
    #validates_length_of :bloco, :maximum => 2, :message => "pode ter no máximo 2 caracteres"
    #validates_length_of :apartamento, :maximum => 4, :message => "pode ter no máximo 4 caracteres"
    validates_numericality_of :bloco, :apartamento, :message => "deve ser preenchido com um número"

end
