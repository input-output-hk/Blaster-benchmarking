import LiveScripts.Shared
import LiveScripts.S_5917ad9f27bb40482eac40027f9dd69898215ef4843a525c4355193b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5917ad9f27bb40482eac40027f9dd69898215ef4843a525c4355193b.script [datum, redeemer, ctx] 10000]
