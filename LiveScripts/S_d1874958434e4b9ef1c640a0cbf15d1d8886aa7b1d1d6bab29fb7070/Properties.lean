import LiveScripts.Shared
import LiveScripts.S_d1874958434e4b9ef1c640a0cbf15d1d8886aa7b1d1d6bab29fb7070.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d1874958434e4b9ef1c640a0cbf15d1d8886aa7b1d1d6bab29fb7070.script [datum, redeemer, ctx] 10000]
