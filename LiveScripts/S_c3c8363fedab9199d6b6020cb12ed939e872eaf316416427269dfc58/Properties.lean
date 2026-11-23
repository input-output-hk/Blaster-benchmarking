import LiveScripts.Shared
import LiveScripts.S_c3c8363fedab9199d6b6020cb12ed939e872eaf316416427269dfc58.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c3c8363fedab9199d6b6020cb12ed939e872eaf316416427269dfc58.script [datum, redeemer, ctx] 10000]
