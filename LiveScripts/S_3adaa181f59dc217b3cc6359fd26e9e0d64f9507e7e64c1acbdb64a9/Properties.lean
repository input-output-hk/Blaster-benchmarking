import LiveScripts.Shared
import LiveScripts.S_3adaa181f59dc217b3cc6359fd26e9e0d64f9507e7e64c1acbdb64a9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3adaa181f59dc217b3cc6359fd26e9e0d64f9507e7e64c1acbdb64a9.script [ctx] 10000]
