import LiveScripts.Shared
import LiveScripts.S_abcff03266e3ce4680d5e71712107224c65305b0ae8c4caad68b415d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_abcff03266e3ce4680d5e71712107224c65305b0ae8c4caad68b415d.script [ctx] 10000]
