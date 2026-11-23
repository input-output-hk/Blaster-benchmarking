import LiveScripts.Shared
import LiveScripts.S_6721ebe2716655847683394da8b78e62b2f9d3547c4e4d6200a8921f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6721ebe2716655847683394da8b78e62b2f9d3547c4e4d6200a8921f.script [datum, redeemer, ctx] 10000]
