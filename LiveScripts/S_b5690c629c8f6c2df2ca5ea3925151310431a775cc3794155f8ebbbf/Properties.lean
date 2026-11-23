import LiveScripts.Shared
import LiveScripts.S_b5690c629c8f6c2df2ca5ea3925151310431a775cc3794155f8ebbbf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5690c629c8f6c2df2ca5ea3925151310431a775cc3794155f8ebbbf.script [ctx] 10000]
