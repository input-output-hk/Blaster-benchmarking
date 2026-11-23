import LiveScripts.Shared
import LiveScripts.S_7d599d7ea9ed7198ef853101c68ee4506e80b96fa2cb5f6638365a68.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d599d7ea9ed7198ef853101c68ee4506e80b96fa2cb5f6638365a68.script [ctx] 10000]
