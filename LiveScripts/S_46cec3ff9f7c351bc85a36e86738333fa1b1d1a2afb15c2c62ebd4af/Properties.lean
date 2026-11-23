import LiveScripts.Shared
import LiveScripts.S_46cec3ff9f7c351bc85a36e86738333fa1b1d1a2afb15c2c62ebd4af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_46cec3ff9f7c351bc85a36e86738333fa1b1d1a2afb15c2c62ebd4af.script [datum, redeemer, ctx] 10000]
