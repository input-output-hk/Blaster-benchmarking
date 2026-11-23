import LiveScripts.Shared
import LiveScripts.S_c732e796a1de63de1989aa0884e5bd75c0b103c855b9a4b6492790a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c732e796a1de63de1989aa0884e5bd75c0b103c855b9a4b6492790a3.script [ctx] 10000]
