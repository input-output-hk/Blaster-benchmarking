import LiveScripts.Shared
import LiveScripts.S_4b293fed31772c6becdac9bd2db2e7f7b64d4ade813db4c3545587dd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4b293fed31772c6becdac9bd2db2e7f7b64d4ade813db4c3545587dd.script [ctx] 10000]
