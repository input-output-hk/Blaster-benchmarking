import LiveScripts.Shared
import LiveScripts.S_f42f7a0c16e377a7313404e8880386a6f8e5725db39985d25757b6ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f42f7a0c16e377a7313404e8880386a6f8e5725db39985d25757b6ba.script [datum, redeemer, ctx] 10000]
