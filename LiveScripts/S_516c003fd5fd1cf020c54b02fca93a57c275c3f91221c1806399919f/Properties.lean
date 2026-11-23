import LiveScripts.Shared
import LiveScripts.S_516c003fd5fd1cf020c54b02fca93a57c275c3f91221c1806399919f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_516c003fd5fd1cf020c54b02fca93a57c275c3f91221c1806399919f.script [ctx] 10000]
