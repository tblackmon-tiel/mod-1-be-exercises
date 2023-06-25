require 'rspec'
require '../lib/medusa'

RSpec.describe Medusa do
  it 'has a name' do
    medusa = Medusa.new('Cassiopeia')
    expect(medusa.name).to eq('Cassiopeia')
  end

  it 'has no statues when created' do
    medusa = Medusa.new('Cassiopeia')
    expect(medusa.statues).to be_empty
  end

  it 'gains a statue when staring at a person' do
    medusa = Medusa.new('Cassiopeia')
    victim = Person.new('Perseus')

    medusa.stare(victim)
    expect(medusa.statues.count).to eq(1)
    expect(medusa.statues.first.name).to eq('Perseus')
    expect(medusa.statues.first).to be_an_instance_of(Person)
  end

  it 'turns a person to stone when staring at them' do
    medusa = Medusa.new('Cassiopeia')
    victim = Person.new('Perseus')

    expect(victim.stoned?).to be false
    medusa.stare(victim)
    expect(victim.stoned?).to be true
  end

  it 'can only have three victims' do
    medusa = Medusa.new('Cassiopeia')
    victim_one = Person.new('Tyler')
    victim_two = Person.new('Kiwi')
    victim_three = Person.new('Chicken')
    victim_four = Person.new('Coco')

    medusa.stare(victim_one)
    medusa.stare(victim_two)
    medusa.stare(victim_three)
    medusa.stare(victim_four)

    expect(medusa.statues.length).to eq(3)
  end

  it 'if a fourth victim is stoned the first is unstoned' do
    medusa = Medusa.new('Cassiopeia')
    victim_one = Person.new('Tyler')
    victim_two = Person.new('Kiwi')
    victim_three = Person.new('Chicken')
    victim_four = Person.new('Coco')

    medusa.stare(victim_one)
    medusa.stare(victim_two)
    medusa.stare(victim_three)
    medusa.stare(victim_four)

    expect(victim_four.stoned?).to be true
    expect(victim_one.stoned?).to be false
  end
end
