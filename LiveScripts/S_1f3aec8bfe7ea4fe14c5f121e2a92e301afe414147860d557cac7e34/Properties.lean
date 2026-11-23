import LiveScripts.Shared
import LiveScripts.S_1f3aec8bfe7ea4fe14c5f121e2a92e301afe414147860d557cac7e34.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1f3aec8bfe7ea4fe14c5f121e2a92e301afe414147860d557cac7e34.script [ctx] 10000]
