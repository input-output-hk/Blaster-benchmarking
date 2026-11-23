import LiveScripts.Shared
import LiveScripts.S_946ae228430f2fc64aa8b3acb910ee27e9b3e47aa8f925fac27834a1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_946ae228430f2fc64aa8b3acb910ee27e9b3e47aa8f925fac27834a1.script [datum, redeemer, ctx] 10000]
