import LiveScripts.Shared
import LiveScripts.S_18c666328c861305db439167464faa2ff9af585dac51cb951859c4ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_18c666328c861305db439167464faa2ff9af585dac51cb951859c4ba.script [datum, redeemer, ctx] 10000]
