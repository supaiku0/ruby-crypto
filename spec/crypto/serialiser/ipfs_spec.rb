require 'spec_helper'

describe ArkEcosystem::Crypto::Serialisers::IPFS do
  describe '#serialise' do
    skip it 'should be ok' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/ipfs.json'), object_class: OpenStruct)

      ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

      actual = ArkEcosystem::Crypto::Serialiser.new(transaction).serialise

      expect(actual).to eq(transaction[:serialized])
    end
  end
end
