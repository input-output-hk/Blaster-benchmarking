import LiveScripts.Shared
import LiveScripts.S_986114a8ad732147749a462dae2b4ec9a3e27b47af9855d2d3cbfeac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_986114a8ad732147749a462dae2b4ec9a3e27b47af9855d2d3cbfeac.script [ctx] 10000]
