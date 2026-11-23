import LiveScripts.Shared
import LiveScripts.S_906eff1be7e1a1873ede5206a9edf08502b6f6beefa03bfbc2da9dfa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_906eff1be7e1a1873ede5206a9edf08502b6f6beefa03bfbc2da9dfa.script [ctx] 10000]
