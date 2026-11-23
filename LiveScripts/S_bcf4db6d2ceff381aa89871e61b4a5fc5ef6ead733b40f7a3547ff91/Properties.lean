import LiveScripts.Shared
import LiveScripts.S_bcf4db6d2ceff381aa89871e61b4a5fc5ef6ead733b40f7a3547ff91.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bcf4db6d2ceff381aa89871e61b4a5fc5ef6ead733b40f7a3547ff91.script [ctx] 10000]
