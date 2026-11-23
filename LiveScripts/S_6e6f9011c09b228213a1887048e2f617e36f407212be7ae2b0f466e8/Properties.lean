import LiveScripts.Shared
import LiveScripts.S_6e6f9011c09b228213a1887048e2f617e36f407212be7ae2b0f466e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e6f9011c09b228213a1887048e2f617e36f407212be7ae2b0f466e8.script [redeemer, ctx] 10000]
