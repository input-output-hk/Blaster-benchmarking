import LiveScripts.Shared
import LiveScripts.S_2c3a242850258ed3ebf501bb9515a159370de774a86fa70e27f24075.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c3a242850258ed3ebf501bb9515a159370de774a86fa70e27f24075.script [datum, redeemer, ctx] 10000]
