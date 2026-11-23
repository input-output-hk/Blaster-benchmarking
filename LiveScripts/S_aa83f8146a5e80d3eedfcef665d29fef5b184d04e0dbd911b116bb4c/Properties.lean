import LiveScripts.Shared
import LiveScripts.S_aa83f8146a5e80d3eedfcef665d29fef5b184d04e0dbd911b116bb4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aa83f8146a5e80d3eedfcef665d29fef5b184d04e0dbd911b116bb4c.script [ctx] 10000]
