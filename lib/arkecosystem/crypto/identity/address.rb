require 'btcruby'
require 'arkecosystem/crypto/configuration/network'

module ArkEcosystem
  module Crypto
    module Identity
      # The identity utility for an address.
      class Address
        def self.from_secret(secret, network = nil)
          private_key = PrivateKey.from_secret(secret)

          from_private_key(private_key, network)
        end

        def self.from_public_key(public_key, network = nil)
          private_key = BTC::Key.new(public_key: [public_key].pack('H*'))

          from_private_key(private_key, network)
        end

        def self.from_private_key(private_key, network = nil)
          network ||= ArkEcosystem::Crypto::Configuration::Network.get

          public_key = Digest::RMD160.digest(private_key.public_key)

          BTC::Base58.base58check_from_data([network.version.to_i(16)].pack('c') + public_key)
        end

        def self.validate(address)
          BTC::Address.parse(address)
        end
      end
    end
  end
end
