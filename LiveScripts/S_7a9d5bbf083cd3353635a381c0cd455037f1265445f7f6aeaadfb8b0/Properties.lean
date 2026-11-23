import LiveScripts.Shared
import LiveScripts.S_7a9d5bbf083cd3353635a381c0cd455037f1265445f7f6aeaadfb8b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7a9d5bbf083cd3353635a381c0cd455037f1265445f7f6aeaadfb8b0.script [ctx] 10000]
