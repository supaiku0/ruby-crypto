module ArkEcosystem
  module Crypto
    module Serialisers
      # The serialiser for timelock transfer transactions.
      class TimelockTransfer < Base
        def serialise
          @bytes << [@transaction[:amount]].pack('Q<')
          @bytes << [@transaction[:timelocktype]].pack('h*')
          @bytes << [@transaction[:timelock]].pack('Q<')

          recipient_id = BTC::Base58.data_from_base58check(@transaction[:recipientId])
          recipient_id = BTC::Data.hex_from_data(recipient_id)

          @bytes << [recipient_id].pack('H*')

          @bytes
        end
      end
    end
  end
end
