import LiveScripts.Shared
import LiveScripts.S_69976d2b117b79fedc0b16497fe37707887f9a59b9e0b4feb5ef4870.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_69976d2b117b79fedc0b16497fe37707887f9a59b9e0b4feb5ef4870.script [ctx] 10000]
