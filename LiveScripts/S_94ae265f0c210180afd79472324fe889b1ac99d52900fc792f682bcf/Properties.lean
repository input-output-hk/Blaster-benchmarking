import LiveScripts.Shared
import LiveScripts.S_94ae265f0c210180afd79472324fe889b1ac99d52900fc792f682bcf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_94ae265f0c210180afd79472324fe889b1ac99d52900fc792f682bcf.script [ctx] 10000]
