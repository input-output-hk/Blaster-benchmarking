import LiveScripts.Shared
import LiveScripts.S_24b2d91925464981af5034b9a3dcb3aace82fedfc0215adadab19262.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_24b2d91925464981af5034b9a3dcb3aace82fedfc0215adadab19262.script [ctx] 10000]
