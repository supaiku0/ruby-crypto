module ArkEcosystem
  module Crypto
    module Serialisers
      # The serialiser for IPFS transactions.
      class IPFS < Base
        def serialise
          dag = @transaction[:asset][:ipfs][:dag]

          @bytes << [dag.length / 2].pack('C')
          @bytes << BTC::Data.data_from_hex(dag)

          @bytes
        end
      end
    end
  end
end
