import LiveScripts.Shared
import LiveScripts.S_094ebcdd0a8a49876505c4a2876e7d83be50d1f8c5ce3efe81001506.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_094ebcdd0a8a49876505c4a2876e7d83be50d1f8c5ce3efe81001506.script [ctx] 10000]
