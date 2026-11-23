import LiveScripts.Shared
import LiveScripts.S_467b76743bb4ec55c83e297144a1daf3e252f5701f359d71c20ac4fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_467b76743bb4ec55c83e297144a1daf3e252f5701f359d71c20ac4fd.script [ctx] 10000]
