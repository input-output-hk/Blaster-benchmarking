import LiveScripts.Shared
import LiveScripts.S_fef12ea655d7d562bd419cad05723e201b1f292e6b6be5a874f073ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fef12ea655d7d562bd419cad05723e201b1f292e6b6be5a874f073ba.script [ctx] 10000]
