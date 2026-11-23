import LiveScripts.Shared
import LiveScripts.S_c9abce00738fa5815cd514cbb7b5cc7a7b007f8ff7ce54b2e597eb0d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c9abce00738fa5815cd514cbb7b5cc7a7b007f8ff7ce54b2e597eb0d.script [ctx] 10000]
