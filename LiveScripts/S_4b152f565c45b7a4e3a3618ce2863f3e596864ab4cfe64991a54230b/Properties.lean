import LiveScripts.Shared
import LiveScripts.S_4b152f565c45b7a4e3a3618ce2863f3e596864ab4cfe64991a54230b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4b152f565c45b7a4e3a3618ce2863f3e596864ab4cfe64991a54230b.script [ctx] 10000]
