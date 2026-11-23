import LiveScripts.Shared
import LiveScripts.S_372da2ccc1f387cc0b590a4576bcf7d291cdd3f200e7c3913a8850d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_372da2ccc1f387cc0b590a4576bcf7d291cdd3f200e7c3913a8850d9.script [ctx] 10000]
