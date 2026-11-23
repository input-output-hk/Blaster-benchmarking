import LiveScripts.Shared
import LiveScripts.S_23680ea6701b56f2c12ae79d8af94fd36f509b7b007029c7ce114840.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23680ea6701b56f2c12ae79d8af94fd36f509b7b007029c7ce114840.script [datum, redeemer, ctx] 10000]
