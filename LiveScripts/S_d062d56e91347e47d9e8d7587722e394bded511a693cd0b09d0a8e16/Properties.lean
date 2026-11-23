import LiveScripts.Shared
import LiveScripts.S_d062d56e91347e47d9e8d7587722e394bded511a693cd0b09d0a8e16.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d062d56e91347e47d9e8d7587722e394bded511a693cd0b09d0a8e16.script [datum, redeemer, ctx] 10000]
