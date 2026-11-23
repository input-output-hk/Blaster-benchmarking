import LiveScripts.Shared
import LiveScripts.S_6fb003585fcdf63810bb9c2a117b71cf61772bebaa31040f84d02928.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6fb003585fcdf63810bb9c2a117b71cf61772bebaa31040f84d02928.script [ctx] 10000]
