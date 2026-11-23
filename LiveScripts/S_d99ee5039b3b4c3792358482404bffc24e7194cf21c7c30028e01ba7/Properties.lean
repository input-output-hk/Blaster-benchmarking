import LiveScripts.Shared
import LiveScripts.S_d99ee5039b3b4c3792358482404bffc24e7194cf21c7c30028e01ba7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d99ee5039b3b4c3792358482404bffc24e7194cf21c7c30028e01ba7.script [ctx] 10000]
