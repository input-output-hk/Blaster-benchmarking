import LiveScripts.Shared
import LiveScripts.S_14eabcf7743b6d322955af1e176d3a2df0e466f98f9dd798db3f7327.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_14eabcf7743b6d322955af1e176d3a2df0e466f98f9dd798db3f7327.script [ctx] 10000]
