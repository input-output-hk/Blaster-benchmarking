import LiveScripts.Shared
import LiveScripts.S_a15ce9d82d2f67645fc624e2edac03c6f1c106d0ad1af5815a3b14ad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a15ce9d82d2f67645fc624e2edac03c6f1c106d0ad1af5815a3b14ad.script [ctx] 10000]
