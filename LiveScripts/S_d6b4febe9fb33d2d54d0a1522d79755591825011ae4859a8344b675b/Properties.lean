import LiveScripts.Shared
import LiveScripts.S_d6b4febe9fb33d2d54d0a1522d79755591825011ae4859a8344b675b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d6b4febe9fb33d2d54d0a1522d79755591825011ae4859a8344b675b.script [datum, redeemer, ctx] 10000]
