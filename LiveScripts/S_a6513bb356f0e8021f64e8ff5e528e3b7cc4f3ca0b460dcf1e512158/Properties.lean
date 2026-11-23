import LiveScripts.Shared
import LiveScripts.S_a6513bb356f0e8021f64e8ff5e528e3b7cc4f3ca0b460dcf1e512158.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a6513bb356f0e8021f64e8ff5e528e3b7cc4f3ca0b460dcf1e512158.script [ctx] 10000]
