# encoding: utf-8

require 'spec_helper'

TEST_ENV = {
  'RUBY_FREE_MIN' => 0,
  'RUBY_GC_MALLOC_LIMIT' => 0,
  'RBENV_SOME' => 0,
  'ZSH-HOME' => 0
}.freeze

describe Nerv do
  subject { Nerv }
  it { should be_a Class }

  describe '.prefix' do
    describe 'with empty ENV' do
      before { stub_const('ENV', {}) }

      it 'returns proper empty Hash' do
        Nerv.prefix('RUBY').should eql({})
      end
    end

    describe 'with non-empty ENV' do
      before { stub_const('ENV', TEST_ENV) }

      describe 'with default separator' do
        it 'returns proper prefix-processed Hash' do
          expected = { 'FREE_MIN' => 0, 'GC_MALLOC_LIMIT' => 0 }
          Nerv.prefix('RUBY').should eql(expected)

          expected = { 'SOME' => 0 }
          Nerv.prefix('RBENV').should eql(expected)
        end
      end

      describe 'with custom separator' do
        it 'returns proper prefix-processed Hash' do
          expected = { 'HOME' => 0 }
          Nerv.prefix('ZSH', '-').should eql(expected)
        end
      end

      describe 'with non-existent prefix' do
        it 'returns empty Hash' do
          expected = {}
          Nerv.prefix('GC').should eql(expected)
        end
      end
    end
  end

  describe '.[]' do
    describe 'with empty ENV' do
      before { stub_const('ENV', {}) }

      it 'returns proper empty Hash' do
        Nerv['RUBY'].should eql({})
      end
    end

    describe 'with non-empty ENV' do
      before { stub_const('ENV', TEST_ENV) }

      describe 'with default separator' do
        it 'returns proper prefix-processed Hash' do
          expected = { 'FREE_MIN' => 0, 'GC_MALLOC_LIMIT' => 0 }
          Nerv['RUBY'].should eql(expected)

          expected = { 'SOME' => 0 }
          Nerv['RBENV'].should eql(expected)
        end
      end

      describe 'with non-existent prefix' do
        it 'returns empty Hash' do
          expected = {}
          Nerv['GC'].should eql(expected)
        end
      end
    end
  end
end
