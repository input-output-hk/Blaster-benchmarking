import LiveScripts.Shared
import LiveScripts.S_5c8b908655af5e66d66364a935225a109ccd8bacee574f73a41486f9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5c8b908655af5e66d66364a935225a109ccd8bacee574f73a41486f9.script [datum, redeemer, ctx] 10000]
