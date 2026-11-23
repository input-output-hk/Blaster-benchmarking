import LiveScripts.Shared
import LiveScripts.S_a831a1e92733e9e28c5e1f4c286391de277fa24d66e2935de6b7b1a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a831a1e92733e9e28c5e1f4c286391de277fa24d66e2935de6b7b1a3.script [ctx] 10000]
