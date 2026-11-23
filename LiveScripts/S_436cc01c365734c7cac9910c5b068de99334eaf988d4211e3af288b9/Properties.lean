import LiveScripts.Shared
import LiveScripts.S_436cc01c365734c7cac9910c5b068de99334eaf988d4211e3af288b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_436cc01c365734c7cac9910c5b068de99334eaf988d4211e3af288b9.script [ctx] 10000]
