import LiveScripts.Shared
import LiveScripts.S_8b0f51b2d7715e3e045c64c8a224bc2cb3abb2be04c87845ac59f9c7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b0f51b2d7715e3e045c64c8a224bc2cb3abb2be04c87845ac59f9c7.script [datum, redeemer, ctx] 10000]
