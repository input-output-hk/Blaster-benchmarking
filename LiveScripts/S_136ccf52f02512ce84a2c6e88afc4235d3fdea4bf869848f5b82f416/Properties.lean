import LiveScripts.Shared
import LiveScripts.S_136ccf52f02512ce84a2c6e88afc4235d3fdea4bf869848f5b82f416.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_136ccf52f02512ce84a2c6e88afc4235d3fdea4bf869848f5b82f416.script [datum, redeemer, ctx] 10000]
