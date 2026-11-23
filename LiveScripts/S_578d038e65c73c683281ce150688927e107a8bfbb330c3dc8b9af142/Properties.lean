import LiveScripts.Shared
import LiveScripts.S_578d038e65c73c683281ce150688927e107a8bfbb330c3dc8b9af142.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_578d038e65c73c683281ce150688927e107a8bfbb330c3dc8b9af142.script [ctx] 10000]
