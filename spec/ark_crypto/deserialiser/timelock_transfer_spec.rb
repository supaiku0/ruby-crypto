require 'spec_helper'
require 'ostruct'

require 'btcruby'
require 'ark_crypto/crypto'
require 'ark_crypto/configuration/network'
require 'ark_crypto/networks/devnet'
require 'ark_crypto/deserialisers/timelock_transfer'

describe ArkCrypto::Deserialisers::TimelockTransfer do
  describe '#deserialise' do
    skip it 'should be ok' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/timelock_transfer.json'), object_class: OpenStruct)

      ArkCrypto::Configuration::Network.set(ArkCrypto::Networks::Devnet)
      deserialiser = ArkCrypto::Deserialisers::TimelockTransfer.new(transaction)

      actual = deserialiser.deserialise

      expect(actual[:id]).to eq(transaction[:id])
    end
  end
end
