import LiveScripts.Shared
import LiveScripts.S_97c8c6bad8e32869bf6fd644f50322c745fa74b45e451aa279849340.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_97c8c6bad8e32869bf6fd644f50322c745fa74b45e451aa279849340.script [ctx] 10000]
