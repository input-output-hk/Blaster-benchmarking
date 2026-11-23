import LiveScripts.Shared
import LiveScripts.S_c8e4346f3ac83c5db09e7c6d03d01c679a19e7ac996f698fd237b29e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c8e4346f3ac83c5db09e7c6d03d01c679a19e7ac996f698fd237b29e.script [ctx] 10000]
