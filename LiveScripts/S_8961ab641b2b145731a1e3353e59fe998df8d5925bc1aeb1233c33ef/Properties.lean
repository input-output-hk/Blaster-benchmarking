import LiveScripts.Shared
import LiveScripts.S_8961ab641b2b145731a1e3353e59fe998df8d5925bc1aeb1233c33ef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8961ab641b2b145731a1e3353e59fe998df8d5925bc1aeb1233c33ef.script [ctx] 10000]
