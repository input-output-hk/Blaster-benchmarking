import LiveScripts.Shared
import LiveScripts.S_8f562749ab79b10ff3285ffc9112c608a029002720b4a714e919989f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8f562749ab79b10ff3285ffc9112c608a029002720b4a714e919989f.script [ctx] 10000]
