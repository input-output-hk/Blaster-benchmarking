import LiveScripts.Shared
import LiveScripts.S_224c43089ab126db699b0b80f20ed3050fe0796a75cba440e2446ad4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_224c43089ab126db699b0b80f20ed3050fe0796a75cba440e2446ad4.script [ctx] 10000]
