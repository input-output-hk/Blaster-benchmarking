import LiveScripts.Shared
import LiveScripts.S_2b26ee29062c63ef9cfb303e25444ae8fb7ce4a9bedc8df44f91bd3c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2b26ee29062c63ef9cfb303e25444ae8fb7ce4a9bedc8df44f91bd3c.script [ctx] 10000]
