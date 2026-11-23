import LiveScripts.Shared
import LiveScripts.S_48c40d0324e63dafed1c0dc9f8180a6069948f59dee4e4021452ae39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_48c40d0324e63dafed1c0dc9f8180a6069948f59dee4e4021452ae39.script [datum, redeemer, ctx] 10000]
