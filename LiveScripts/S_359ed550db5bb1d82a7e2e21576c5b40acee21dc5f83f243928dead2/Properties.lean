import LiveScripts.Shared
import LiveScripts.S_359ed550db5bb1d82a7e2e21576c5b40acee21dc5f83f243928dead2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_359ed550db5bb1d82a7e2e21576c5b40acee21dc5f83f243928dead2.script [ctx] 10000]
