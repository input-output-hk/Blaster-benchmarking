import LiveScripts.Shared
import LiveScripts.S_158cc82ce89babb41980af3122b2c4a729f6dbb8e7b81930901a856d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_158cc82ce89babb41980af3122b2c4a729f6dbb8e7b81930901a856d.script [datum, redeemer, ctx] 10000]
