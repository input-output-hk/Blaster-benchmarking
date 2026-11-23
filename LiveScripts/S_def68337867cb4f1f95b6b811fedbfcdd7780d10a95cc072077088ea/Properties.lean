import LiveScripts.Shared
import LiveScripts.S_def68337867cb4f1f95b6b811fedbfcdd7780d10a95cc072077088ea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_def68337867cb4f1f95b6b811fedbfcdd7780d10a95cc072077088ea.script [ctx] 10000]
