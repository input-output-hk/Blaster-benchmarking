import LiveScripts.Shared
import LiveScripts.S_3ae47cac133614bf109382afe2e28a921bcbacdd65ec0c496f9801a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3ae47cac133614bf109382afe2e28a921bcbacdd65ec0c496f9801a4.script [ctx] 10000]
