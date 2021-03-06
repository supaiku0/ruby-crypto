module ArkEcosystem
  module Crypto
    module Deserialisers
      # The deserialiser for second signature registrations transactions.
      class SecondSignatureRegistration < Base
        def deserialise
          @transaction[:asset] = {
            signature: {}
          }

          @transaction[:asset][:signature][:public_key] = @serialised[@asset_offset, 66]

          ArkEcosystem::Crypto::Crypto.parse_signatures(@serialised, @transaction, @asset_offset + 66)
        end
      end
    end
  end
end
