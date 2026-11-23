import LiveScripts.Shared
import LiveScripts.S_5574294f5eabd5c8c3c0c0c6e8d6f7d809096912fce82cbb271a91d3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5574294f5eabd5c8c3c0c0c6e8d6f7d809096912fce82cbb271a91d3.script [ctx] 10000]
