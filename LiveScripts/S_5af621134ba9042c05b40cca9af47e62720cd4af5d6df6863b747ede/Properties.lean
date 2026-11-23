import LiveScripts.Shared
import LiveScripts.S_5af621134ba9042c05b40cca9af47e62720cd4af5d6df6863b747ede.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5af621134ba9042c05b40cca9af47e62720cd4af5d6df6863b747ede.script [ctx] 10000]
