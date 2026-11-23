import LiveScripts.Shared
import LiveScripts.S_d9734dc3225ae877270e895d0ec77145a1dd0c826f207702ed837fbc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d9734dc3225ae877270e895d0ec77145a1dd0c826f207702ed837fbc.script [datum, redeemer, ctx] 10000]
