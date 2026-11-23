import LiveScripts.Shared
import LiveScripts.S_c9121fbe65082a02e7267fe2bf3d1f4d51bfbe84bd8505c70d3b6f91.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c9121fbe65082a02e7267fe2bf3d1f4d51bfbe84bd8505c70d3b6f91.script [ctx] 10000]
