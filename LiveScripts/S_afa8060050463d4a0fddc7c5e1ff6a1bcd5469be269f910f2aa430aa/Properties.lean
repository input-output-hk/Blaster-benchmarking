import LiveScripts.Shared
import LiveScripts.S_afa8060050463d4a0fddc7c5e1ff6a1bcd5469be269f910f2aa430aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_afa8060050463d4a0fddc7c5e1ff6a1bcd5469be269f910f2aa430aa.script [datum, redeemer, ctx] 10000]
