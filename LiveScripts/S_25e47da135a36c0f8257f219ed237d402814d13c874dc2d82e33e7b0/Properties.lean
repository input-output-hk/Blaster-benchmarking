import LiveScripts.Shared
import LiveScripts.S_25e47da135a36c0f8257f219ed237d402814d13c874dc2d82e33e7b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_25e47da135a36c0f8257f219ed237d402814d13c874dc2d82e33e7b0.script [ctx] 10000]
