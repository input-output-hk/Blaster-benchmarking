import LiveScripts.Shared
import LiveScripts.S_a95abcc467e46a7f1540909061cb05ab7ce2396e86156817568843e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a95abcc467e46a7f1540909061cb05ab7ce2396e86156817568843e8.script [ctx] 10000]
