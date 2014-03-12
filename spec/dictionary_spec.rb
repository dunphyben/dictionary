require 'rspec'
require 'term'

describe 'Term' do
  before do
    Term.clear
  end

  describe '#initialize' do
    it 'initializes a term with a word and definition' do
      test_term = Term.new('eloquent', 'able to speak well')
      test_term.should be_an_instance_of Term
    end
  end

  describe '.create' do
    it 'makes a new instance of Term' do
      test_term = Term.create('eloquent', 'able to speak well')
      test_term.should be_an_instance_of Term
    end

    it 'saves it' do
      test_term = Term.create('eloquent', 'able to speak well')
      Term.all.should eq [test_term]
    end
  end

  describe '.all' do
    it 'is empty at first' do
      Term.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a term to the array of saved terms' do
      test_term = Term.new('eloquent', 'able to speak well')
      test_term.save
      Term.all.should eq [test_term]
    end
  end

  describe '.clear' do
    it 'empties out all of the saved terms from the array' do
      Term.new('eloquent', 'able to speak well').save
      Term.clear
      Term.all.should eq []
    end
  end

end
