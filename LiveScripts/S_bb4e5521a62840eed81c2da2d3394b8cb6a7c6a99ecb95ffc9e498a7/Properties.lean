import LiveScripts.Shared
import LiveScripts.S_bb4e5521a62840eed81c2da2d3394b8cb6a7c6a99ecb95ffc9e498a7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bb4e5521a62840eed81c2da2d3394b8cb6a7c6a99ecb95ffc9e498a7.script [ctx] 10000]
