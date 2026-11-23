import LiveScripts.Shared
import LiveScripts.S_7e2545592a34f3366ce55a38745c9a32dcee14105a6b0aec702063d4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7e2545592a34f3366ce55a38745c9a32dcee14105a6b0aec702063d4.script [ctx] 10000]
