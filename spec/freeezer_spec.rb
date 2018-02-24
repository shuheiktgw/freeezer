require 'freeezer'

RSpec.describe Freeezer do
  class Test
    using Freeezer

    def deep_freeze(value)
      value.tap {|v| v.deep_freeze }
    end
  end

  def assert_frozen(original)
    if original.is_a?(Array)
      original.each do |v|
        assert_frozen v
      end
    elsif original.is_a?(Hash)
      original.each do |_k, v|
        assert_frozen v
      end
    end

    expect(original).to be_frozen
  end

  describe '#deep_freeze' do
    subject(:result) { Test.new.deep_freeze(value) }

    context 'Simple Hash' do
      let(:value) { { test: 'test' } }

      it { assert_frozen result }
    end

    context 'Hash within Hash' do
      let(:value) { { one: { one: 'one', two: 'two', three: 'three' }, two: 'two', three: { one: 'one' } } }

      it { assert_frozen result }
    end

    context 'Array within Hash' do
      let(:value) { { one: ['1', '2', '3', { one: 'one', two: 'two' }], two: { one: ['1', '2'] }, three: 'three' } }

      it { assert_frozen result }
    end

    context 'Simple Array' do
      let(:value) { ['1', '2', '3'] }

      it { assert_frozen result }
    end

    context 'Array within Array' do
      let(:value) { [['1', '2', '3', ['1', '2', ['1']]], '2', '3', ['1', '2', '3']] }

      it { assert_frozen result }
    end

    context 'Hash within Array' do
      let(:value) { [{ one: 'one', two: { one: ['1', '2', '3'], two: { one: ['1', '2'] } }, three: 'three' }] }

      it { assert_frozen result }
    end
  end
end
