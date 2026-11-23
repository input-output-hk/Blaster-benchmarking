import LiveScripts.Shared
import LiveScripts.S_08eacb7bb7ce72e6da452c8a76f7aa1575e3eb41e950e546f242546d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_08eacb7bb7ce72e6da452c8a76f7aa1575e3eb41e950e546f242546d.script [ctx] 10000]
