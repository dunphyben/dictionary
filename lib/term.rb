class Term
  attr_reader :word
  attr_accessor :definition
  @@terms = []

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def Term.all
    @@terms
  end

  def Term.clear
    @@terms = []
  end

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def save
    @@terms << self
    @@terms.sort! { |a,b| a.word <=> b.word }
  end


  # def word
  #   @word
  # end

  # def defintion
  #   @definition
  # end





end
