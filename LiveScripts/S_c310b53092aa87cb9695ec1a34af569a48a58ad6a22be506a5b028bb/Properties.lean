import LiveScripts.Shared
import LiveScripts.S_c310b53092aa87cb9695ec1a34af569a48a58ad6a22be506a5b028bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c310b53092aa87cb9695ec1a34af569a48a58ad6a22be506a5b028bb.script [datum, redeemer, ctx] 10000]
